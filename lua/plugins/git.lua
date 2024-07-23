-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufReadPre',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		'sindrets/diffview.nvim',
		cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
		keys = {
			{ '<leader>gdo', '<cmd>DiffviewOpen<CR>', desc = 'Open git diff view' },
			{ '<leader>gdc', '<cmd>DiffviewClose<CR>', desc = 'Close git diff view' },
			{ '<leader>gh', '<cmd>DiffviewFileHistory<CR>', desc = 'Open git file history' },
		},
		opts = function(_, opts)
			opts.enhanced_diff_hl = true
		end,
	},
}
