return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-telescope/telescope-smart-history.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
		{ 'kkharji/sqlite.lua' },
		{
			'rcarriga/nvim-notify',
			config = function()
				vim.notify = require('notify')
				vim.keymap.set('n', '<leader>nu', function()
					require('notify').dismiss({ silent = true, pending = true })
				end)
			end,
		},
	},
	config = function()
		local actions = require('telescope.actions')
		local data = assert(vim.fn.stdpath('data')) --[[@as string]]
		require('telescope').setup({
			extensions = {
				-- fzf = {},
				history = {
					path = vim.fs.joinpath(data, 'telescope_history.sqlite3'),
					limit = 100,
				},
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
			defaults = {
				layout_strategy = 'horizontal',
				sorting_strategy = 'ascending',
				layout_config = {
					prompt_position = 'top',
				},
				mappings = {
					n = {
						['<C-c>'] = {
							actions.close,
							type = 'action',
							opts = { nowait = true, silent = true },
            },
						['<C-j>'] = {
							actions.move_selection_next,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-k>'] = {
							actions.move_selection_previous,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-h>'] = 'which_key',
						['<C-p>'] = {
							actions.cycle_history_next,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-n>'] = {
							actions.cycle_history_prev,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
					},
					i = {
						['<C-j>'] = {
							actions.move_selection_next,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-k>'] = {
							actions.move_selection_previous,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-h>'] = 'which_key',
						['<C-p>'] = {
							actions.cycle_history_next,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
						['<C-n>'] = {
							actions.cycle_history_prev,
							type = 'action',
							opts = { nowait = true, silent = true },
						},
					},
				},
			},
		})

		-- require("telescope").load_extension("fzf")
		require('telescope').load_extension('smart_history')
		require('telescope').load_extension('ui-select')
		require('telescope').load_extension('notify')

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch Select [T]elescope' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>s/', builtin.live_grep, { desc = '[S]earch by [/]Grep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = '[S]earch [R]ecent' })
		vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it Files' })
		vim.keymap.set('n', '<leader>sc', builtin.git_commits, { desc = '[S]earch Git [C]ommits' })
		vim.keymap.set('n', '<leader>sb', builtin.git_branches, { desc = '[S]earch Git [B]ranches' })
		vim.keymap.set('n', '<leader>s.', builtin.resume, { desc = '[S]earch Resume Search ("." for repeat)' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = '[/] Fuzzily search in current buffer' })

		vim.keymap.set('n', '<leader>s/', function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			})
		end, { desc = '[S]earch [/] in Open Files' })
	end,
}
