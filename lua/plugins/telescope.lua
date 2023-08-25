return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	lazy = false,
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
	},
	config = function()
		require("telescope").load_extension("notify")
	end,
}
