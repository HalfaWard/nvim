return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-smart-history.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "kkharji/sqlite.lua" },
		{
			"rcarriga/nvim-notify",
			config = function ()
				vim.notify = require("notify")
				vim.keymap.set("n", "<leader>nu", function() require("notify").dismiss({ silent = true, pending = true }) end)
			end,
		}
	},
	config = function()
		local actions = require("telescope.actions")
		local data = assert(vim.fn.stdpath "data") --[[@as string]]
		require("telescope").setup({
			extensions = {
				fzf = {},
				history = {
					path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
					limit = 100,
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close
					},
				},
			},
		})

		-- require("telescope").load_extension("fzf")
		require("telescope").load_extension("smart_history")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("notify")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "[F]ind by [/]Grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it Files" })
		vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "[F]ind Git [C]ommits" })
		vim.keymap.set("n", "<leader>fb", builtin.git_branches, { desc = "[F]ind Git [B]ranches" })
		vim.keymap.set("n", "<leader>f.", builtin.resume, { desc = '[F]ind Resume Search ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- vim.keymap.set("n", "<leader>fn", require('telescope').extensions.notify.notify({}), { desc = '[F]ind all notifications' })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })
	end,
}
