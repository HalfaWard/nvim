-- This file can be loaded by calling 'lua require('plugins')' from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd.packadd('packer.nvim')
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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

    -- Treesitter
	use({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"})
	use('nvim-treesitter/playground')
	use('nvim-treesitter/nvim-treesitter-context')
    -- Harpoon
	use('theprimeagen/harpoon')
    -- Undotree
	use('mbbill/undotree')
    -- Fugitive for Git
	use('tpope/vim-fugitive')
    -- Find
    use('sharkdp/fd')
    -- LuaLine
    use('nvim-lualine/lualine.nvim')
    -- Nvim Tree
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons')

    -- LSP Zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim',
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
    -- Zen mode
	use('folke/zen-mode.nvim')

	-- use('github/copilot.vim')
	use('eandrju/cellular-automaton.nvim')
	use('laytan/cloak.nvim')

    if packer_bootstrap then
        require('packer').sync()
    end
end)





