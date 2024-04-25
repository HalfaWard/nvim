-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Chack if we need to reload the file when it changed
vim.api.nvim_create_autocmd('FocusGained', { command = 'checktime' })

--Go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPre', {
	pattern = '*',
	callback = function ()
		vim.api.nvim_create_autocmd('FileType',{
			pattern = '<buffer>',
			once = true,
			callback = function ()
				vim.cmd(
					[[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
				)
			end,
		})
	end,
})
