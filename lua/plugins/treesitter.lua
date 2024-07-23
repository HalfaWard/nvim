local languages = {
	'bash',
	'c',
	'c_sharp',
	'html',
	'lua',
	'luadoc',
	'markdown',
	'markdown_inline',
	'vim',
	'vimdoc',
	'typescript',
	'javascript',
	'tsx',
}

return {
	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		lazy = true,
		build = ':TSUpdate',
		dependencies = {
			'windwp/nvim-ts-autotag',
		},
		opts = {},
		config = function()
			local treesitter = require('nvim-treesitter.configs')
			treesitter.setup({
				ensure_installed = languages,
				autotag = { enable = true },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<C-space>',
						node_incremental = '<C-space>',
						scope_incremental = false,
						node_decremental = '<bs>',
					},
				},
			})
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require('nvim-treesitter.configs').setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['oa'] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
							['ia'] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
							['la'] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
							['ra'] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

							['oo'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
							['io'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
							['lo'] = { query = '@property.lhs', desc = 'Select left hand side of an object property' },
							['ro'] = { query = '@property.rhs', desc = 'Select right hand side of an object property' },

							['op'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
							['ip'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

							['o='] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
							['i=:'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

							['ol'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
							['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

							['oc'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
							['ic'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

							['of'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
							['if'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = { '@parameter.inner', '@parameter.inner' },
						},
						swap_previous = {
							['<leader>A'] = { '@parameter.inner', '@parameter.inner' },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							['<DEL>f'] = { query = '@call.outer', desc = 'Next [f]unction callstart' },
							['<DEL>m'] = { query = '@function.outer', desc = 'Next [m]ethod/function def start' },
							['<DEL>c'] = { query = '@class.outer', desc = 'Next [c]lass start' },
							['<DEL>i'] = { query = '@conditional.outer', desc = 'Next cond[i]tional start' },
							['<DEL>l'] = { query = '@loop.outer', desc = 'Next [l]oop start' },
						},
						goto_next_end = {
							['<DEL>F'] = { query = '@call.outer', desc = 'Next [f]unction call end' },
							['<DEL>M'] = { query = '@function.outer', desc = 'Next [m]ethod/function def end' },
							['<DEL>C'] = { query = '@class.outer', desc = 'Next [c]lass end' },
							['<DEL>I'] = { query = '@conditional.outer', desc = 'Next cond[i]tional end' },
							['<DEL>L'] = { query = '@loop.outer', desc = 'Next [l]oop end' },
						},
						goto_previous_start = {
							['<CR>f'] = { query = '@call.outer', desc = 'Prev [f]unction call start' },
							['<CR>m'] = { query = '@function.outer', desc = 'Prev [m]ethod/function def start' },
							['<CR>c'] = { query = '@class.outer', desc = 'Prev [c]lass start' },
							['<CR>i'] = { query = '@conditional.outer', desc = 'Prev cond[i]tional start' },
							['<CR>l'] = { query = '@loop.outer', desc = 'Prev [l]oop start' },
						},
						goto_prevous_end = {
							['<CR>F'] = { query = '@call.outer', desc = 'Prev [f]unction call end' },
							['<CR>M'] = { query = '@function.outer', desc = 'Prev [m]ethod/function def end' },
							['<CR>C'] = { query = '@class.outer', desc = 'Prev [c]lass end' },
							['<CR>I'] = { query = '@conditional.outer', desc = 'Prev cond[i]tional end' },
							['<CR>L'] = { query = '@loop.outer', desc = 'Prev [l]oop end' },
						},
					},
				},
			})

			local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

			vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
			vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

			vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

			vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
		end,
	},
}
