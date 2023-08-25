local M = {}

local servers = {
	omnisharp = {
		init = function()
			require("lazyvim.util").on_attach(function(client, _)
				if client.name == "omnisharp" then
					client.server_capabilities.semanticTokensProvider = {
						full = vim.empty_dict(),
						legend = {
							tokenModifiers = { "static_symbol" },
							tokenTypes = {
								"comment",
								"excluded_code",
								"identifier",
								"keyword",
								"keyword_control",
								"number",
								"operator",
								"operator_overloaded",
								"preprocessor_keyword",
								"string",
								"whitespace",
								"text",
								"static_symbol",
								"preprocessor_text",
								"punctuation",
								"string_verbatim",
								"string_escape_character",
								"class_name",
								"delegate_name",
								"enum_name",
								"interface_name",
								"module_name",
								"struct_name",
								"type_parameter_name",
								"field_name",
								"enum_member_name",
								"constant_name",
								"local_name",
								"parameter_name",
								"method_name",
								"extension_method_name",
								"property_name",
								"event_name",
								"namespace_name",
								"label_name",
								"xml_doc_comment_attribute_name",
								"xml_doc_comment_attribute_quotes",
								"xml_doc_comment_attribute_value",
								"xml_doc_comment_cdata_section",
								"xml_doc_comment_comment",
								"xml_doc_comment_delimiter",
								"xml_doc_comment_entity_reference",
								"xml_doc_comment_name",
								"xml_doc_comment_processing_instruction",
								"xml_doc_comment_text",
								"xml_literal_attribute_name",
								"xml_literal_attribute_quotes",
								"xml_literal_attribute_value",
								"xml_literal_cdata_section",
								"xml_literal_comment",
								"xml_literal_delimiter",
								"xml_literal_embedded_expression",
								"xml_literal_entity_reference",
								"xml_literal_name",
								"xml_literal_processing_instruction",
								"xml_literal_text",
								"regex_comment",
								"regex_character_class",
								"regex_anchor",
								"regex_quantifier",
								"regex_grouping",
								"regex_alternation",
								"regex_text",
								"regex_self_escaped_character",
								"regex_other_escape",
							},
						},
						range = true,
					}
				end
			end)
		end,
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = {
					command = "cargo clippy",
					extraArgs = { "--no-deps" },
				},
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = { callSnippet = "Replace" },
				telemetry = { enable = false },
				hint = {
					enable = false,
				},
			},
		},
	},
}

local function lsp_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

local function lsp_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function M.setup(_)
	lsp_attach(function(client, buffer)
		require("plugins.lsp.format").on_attach(client, buffer)
		require("plugins.lsp.keymaps").on_attach(client, buffer)
	end)

	require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
	require("mason-lspconfig").setup_handlers({
		function(server)
			local opts = servers[server] or {}
			opts.capabilities = lsp_capabilities()
			require("lspconfig")[server].setup(opts)
		end,
		["rust_analyzer"] = function(server)
			local rt = require("rust-tools")
			local opts = servers[server] or {}
			opts.capabilities = lsp_capabilities()
			rt.setup({ server = opts })
		end,
	})
end

return M
