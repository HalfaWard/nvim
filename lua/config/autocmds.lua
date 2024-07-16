-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function augroup(name, opts)
	return vim.api.nvim_create_augroup('hwp_' .. name, opts)
end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Chack if we need to reload the file when it changed
vim.api.nvim_create_autocmd(
	{'FocusGained', 'TermClose', 'TermLeave' },{
	group = augroup('checktime', {}),
	callback = function()
		if vim.o.buftype ~= 'nofile' then
			vim.cmd('checktime')
		end
	end,
})

--Go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPre', {
	group = augroup('last_loc', {}),
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
