return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
	},
	{
		"fei6409/log-highlight.nvim",
		event = "BufReadPre",
		config = function()
			require("log-highlight").setup({})
		end,
	},
	{
		"cbochs/portal.nvim",
		dependencies = {
			"cbochs/grapple.nvim",
			"theprimeagen/harpoon",
		},
		keys = {
			{ "<leader>i", mode = "n", "<cmd>Portal jumplist backward<cr>" },
			{ "<leader>o", mode = "n", "<cmd>Portal jumplist forward<cr>" },
		},
	},
}
