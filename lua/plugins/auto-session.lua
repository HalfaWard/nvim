return {
	"rmagatti/auto-session",
	dependencies = {
		"nvim-telescode/telescope.nvim",
	},
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/Downloads" },
			session_lens = {
				load_on_setup = true,
				theme_conf = {
					border = true,
				},
				previewer = false,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ss",
			require("auto-session.session-lens").search_session,
			{ desc = "[S]earch [S]essions", noremap = true, silent = true }
		)
	end,
}
