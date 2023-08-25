return {
	{
		"xiyaowong/transparent.nvim",
		enabled = true,
		priority = 1000,
		lazy = false,
		config = function()
			require("transparent").setup({
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
					"NvimTreeNormal",
				},
				extra_groups = {}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
			vim.cmd([[TransparentEnable]])
		end,
	},
	{
		"zootedb0t/citruszest.nvim",
		enabled = true,
		init = function()
			vim.cmd("colorscheme citruszest")
		end,
		priority = 2000,
	},
	--    {
	--        'folke/styler.nvim',
	--        event = 'VeryLazy',
	--        config = function()
	--            require('styler').setup{
	--                themes = {
	--                    markdown = { colorscheme = 'gruvbox' },
	--                    help = { colorscheme = 'gruvbox' },
	--                },
	--            }
	--        end,
	--    },
	--    {
	--        'folke/tokyonight.nvim',
	--        lazy = false,
	--        priority = 500,
	--        config = function()
	--            local tokyonight = require 'tokyonight'
	--            tokyonight.setup {style = 'storm'}
	--            tokyonight.load()
	--        end,
	--    },
}
