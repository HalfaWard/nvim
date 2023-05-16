require('hwp.set')
require('hwp.remap')
require('hwp.plugins')

local augroup = vim.api.nvim_create_augroup
local hwpGroup = augroup('hwp', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HiglightYank', {})

-- require('mason').setup()

function R(name)
	require('plenary.reload').reload_module(name)
end

autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

autocmd({"BufWritePre"}, {
	group = hwpGroup,
	pattern = '*',
	command = [[%s/\s|+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
