function Color(color)
	color = color or "monokai-nightasty"
	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			on_colors = function(colors)
				colors.bg = "#0f1414"
				colors.blue = "#66D9EF"
				colors.yellow = "#ff8f00"
				colors.purple = "#6054d0"
				colors.green = "#A7EC21"
				colors.magenta = "#F92672"
				colors.orange = "#ff4d00"
			end,
		},
		conifg = function (_, opts)
			require('monokai-nightasty').load(opts)
		end,
		init = function ()
			vim.cmd.colorscheme("monokai-nightasty")
		end
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				terminal_colors = false,
				borderless_telescope = { border = false, style = "flat" },
				theme = {
					variant = "auto",
					overrides = function(colours)
						return {
							TelescopePromptPrefix = { fg = colours.blue },
							TelescopeMatching = { fg = colours.cyan },
							TelescopeResultsTitle = { fg = colours.blue },
							TelescopePromptCounter = { fg = colours.cyan },
							TelescopePromptTitle = { fg = colours.bg, bg = colours.blue, bold = true },
						}
					end,
				},
			})

			vim.cmd("colorscheme cyberdream")
			vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
			vim.api.nvim_create_autocmd("User", {
				pattern = "CyberdreamToggleMode",
				callback = function(ev)
					print("Switched to " .. ev.data .. " mode!")
				end,
			})
		end,
	},
}
