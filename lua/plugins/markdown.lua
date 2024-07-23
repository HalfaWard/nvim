local M = {
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown", "md" },
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		build = function()
			local install_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app"
			vim.cmd("silent !cd " .. install_path .. " && npm install && git restore .")
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = 0
		end,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown",
		ft = { "markdown", "md" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("render-markdown").setup({})
			require("render-markdown").enable()
			vim.keymap.set({ "n", "v" }, "<leader>md", function()
				require("render-markdown").toggle()
			end, { desc = "Toggle markdown preview" })

			local md_augroup = vim.api.nvim_create_augroup("markdown", { clear = true })
			vim.api.nvim_create_autocmd("BufEnter", {
				group = md_augroup,
				callback = function()
					vim.opt_local.conceallevel = 2
				end,
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = { "markdown", "md" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "c:/Repos/Notes/",
				},
			},
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = tostring(os.time()) .. "-" .. string.char(math.random(65, 90))
					end
				end
				return suffix
			end,
			disable_frontmatter = true,
			ui = {
				checkboxes = {},
				bullets = {},
				external_link_icon = {},
			},
		},
	},
}
return M
