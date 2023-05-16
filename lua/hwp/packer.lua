-- This file can be loaded by calling 'lua require('plugins')' from your init.vim

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
         'git',
         'clone',
         '--filter=blob:none',
         'https://github.com/folke/lazy.nvim.git',
         '--branch=stable',
         lazypath,
     })
 end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Packer can manage itself
	'wbthomason/packer.nvim',
	{
		'nvim-telescope/telescope.nvim', 
        tag = '0.1.0',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'tanvirtin/monokai.nvim',
		as = 'monokai',
	},
	{
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup{
				icons = true,
			}
		end
	},
    -- Treesitter
	{'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"},
	'nvim-treesitter/playground',
	'nvim-treesitter/nvim-treesitter-context',
    -- Harpoon
	'theprimeagen/harpoon',
    -- Undotree
	'mbbill/undotree',
    -- Fugitive for Git
	'tpope/vim-fugitive',
    -- Find
    'sharkdp/fd',
    -- LuaLine
    'nvim-lualine/lualine.nvim',
    -- Nvim Tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- LSP Zero
	{
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
	},
    -- Zen mode
	'folke/zen-mode.nvim',

	-- 'github/copilot.vim',
	'eandrju/cellular-automaton.nvim',
	'laytan/cloak.nvim',
}

local opts = {}

require('lazy').setup(plugins, opts)



