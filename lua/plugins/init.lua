return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{ "stevearc/dressing.nvim", event = "VeryLazy", config = true },
	{ "rcarriga/nvim-notify", event = "VeryLazy", enabled = true, config = { default = true } },
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = { integrations = { diffview = true } },
		keys = { { "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" } },
	},
	{
		"monaqa/dial.nvim",
		event = "BufReadPre",
		config = function()
			vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
			vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
			vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
			vim.api.nvim_set_keymap("v", "<gC-x>", require("dial.map").dec_gvisual(), { noremap = true })
		end,
	},
	{
		"fei6409/log-highlight.nvim",
		event = "BufReadPre",
		config = function()
			require("log-highlight").setup({})
		end,
	},
}
