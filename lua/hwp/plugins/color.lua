function Color(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	enabled = true,
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("transparent").setup({
	-- 			groups = { -- table: default groups
	-- 				"Normal",
	-- 				"NormalNC",
	-- 				"Comment",
	-- 				"Constant",
	-- 				"Special",
	-- 				"Identifier",
	-- 				"Statement",
	-- 				"PreProc",
	-- 				"Type",
	-- 				"Underlined",
	-- 				"Todo",
	-- 				"String",
	-- 				"Function",
	-- 				"Conditional",
	-- 				"Repeat",
	-- 				"Operator",
	-- 				"Structure",
	-- 				"LineNr",
	-- 				"NonText",
	-- 				"SignColumn",
	-- 				"CursorLineNr",
	-- 				"EndOfBuffer",
	-- 				"NvimTreeNormal",
	-- 			},
	-- 			extra_groups = {}, -- table: additional groups that should be cleared
	-- 			exclude_groups = {}, -- table: groups you don't want to clear
	-- 		})
	-- 		vim.cmd([[TransparentEnable]])
	-- 	end,
	-- },
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		-- alts: 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme("tokyonight-night")

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
}
