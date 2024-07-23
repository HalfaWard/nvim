return {
	'mfussenegger/nvim-lint',
	event = { 'BufWritePre', 'BufRead' },
	config = function()
		local lint = require('lint')

		lint.linters_by_ft = {
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			css = { 'stylelint' },
			html = { 'stylelint' },
			json = { 'jsonlint' },
			yaml = { 'yamllint' },
			markdown = { 'markdownlint' },
		}

		local lint_augroug = vim.api.nvim_create_augroup('lint', { clear = true })

		vim.api.nvim_create_autocmd({ 'BufWritePre', 'BufEnter', 'InsertLeave' }, {
			group = lint_augroug,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set('n', '<leader>fl', function()
			lint.try_lint()
		end, { desc = '[F]ile: [L]int' })
	end,
}
