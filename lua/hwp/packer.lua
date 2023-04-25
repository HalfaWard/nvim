
-- This file can be loaded by calling 'lua require('plugins')' from your init.vim


-- Only required if you have packer configured as 'opt'
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or				, branch = '0.1.x'
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use({
		'tanvirtin/monokai.nvim',
		as = 'monokai',
		config = function()
			vim.cmd('colorscheme monokai_pro')
		end
	})

	use({
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup{
				icons = true,
			}
		end
	})

	use({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"})
	use('nvim-treesitter/playground')
	use('nvim-treesitter/nvim-treesitter-context')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    use('sharkdp/fd')
    use{
        'williamboman/mason.nvim',
        run = ':MasonUpdate'
    }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'saadparwaiz1/cmp_luasnip'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	
	use('folke/zen-mode.nvim')
	-- use('github/copilot.vim')
	use('eandrju/cellular-automaton.nvim')
	use('laytan/cloak.nvim')
end)





