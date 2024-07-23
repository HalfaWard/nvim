return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/nvim-cmp",
		"Hoffs/omnisharp-extended-lsp.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		--  This function gets run when an LSP attaches to a particular buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor. to jump back, press <C-t>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Show the incoming calls to the function under your cursor.
				-- map('gD', vim.lsp.buf.incoming_calls(), '[G]oto [D]eclaration')

				-- Find references for the word under your cursor.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your curret document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap.
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local rounded_border_handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			-- General
			pyright = {},
			rust_analyzer = {},

			-- NodeJS
			tsserver = {},
			eslint = {},
			tailwindcss = {},

			-- C#
			omnisharp = {
				root_dir = function(fname)
					local lspconfig = require("lspconfig")
					local primary = lspconfig.util.root_pattern("*.sln")(fname)
					local fallback = lspconfig.util.root_pattern("*.csproj")(fname)
					return primary or fallback
				end,
				settings = {
					FormattingOptions = {
						enableEditorConfigSupport = false,
						organizeImportsOnFormat = false,
					},
					RozlynExtensionsOptions = {
						enableAnalyzersSupport = true,
						enableImportCompletion = true,
						enableDecompilationSupport = true,
					},
				},
				filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets", "cshtml", "razor" },
				on_attach = function(_, bufnr)
					vim.keymap.set(
						"n",
						"gd",
						require("omnisharp_extended").lsp_definition,
						{ noremap = true, silent = true, buffer = bufnr, desc = "LSP [G]o to [D]efinition csharp" }
					)
					vim.keymap.set(
						"n",
						"gr",
						require("omnisharp_extended").lsp_references,
						{ noremap = true, silent = true, buffer = bufnr, desc = "LSP [G]o to [R]eferences csharp" }
					)
					vim.keymap.set(
						"n",
						"gi",
						require("omnisharp_extended").lsp_implementation,
						{ noremap = true, silent = true, buffer = bufnr, desc = "LSP [G]o to [I]mplementation csharp" }
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						require("omnisharp_extended").lsp_type_definition,
						{ noremap = true, silent = true, buffer = bufnr, desc = "LSP TypeDefinition csharp" }
					)
				end,
			},

			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "bit", "vim", "describe", "it", "before_each", "after_each" },
						},
					},
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"prettierd",
			"biome",
			"stylua",
			"yaml-language-server",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"json-lsp",
			"html-lsp",
			"powershell-editor-services",
			"js-debug-adapter",
			"typescript-language-server",
			"eslint-lsp",
			"eslint_d",
			"tailwindcss-language-server",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					server.handlers = vim.tbl_deep_extend("force", rounded_border_handlers, server.handlers or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
