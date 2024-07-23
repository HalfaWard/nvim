return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufWritePre', 'BufNewFile' },
	config = function()
		local conform = require('conform')

		conform.setup({
			formatters_by_ft = {
				javascript = { 'biome' },
				typescript = { 'biome' },
				javascriptreact = { 'biome' },
				typescriptreact = { 'biome' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				json = { 'biome' },
				yaml = { 'prettierd' },
				markdown = { 'prettierd' },
				graphql = { 'prettierd' },
				lua = { 'stylua' },
				python = { 'black' },
				scss = { 'prettierd' },
				less = { 'prettierd' },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timout_ms = 1000,
			},
		})

		vim.keymap.set('n', '<leader>ff', function()
			conform.format({
				lsp_fallback = false,
				async = false,
				timout_ms = 1000,
			})
		end, { desc = '[F]ile: format' })
	end,
}
