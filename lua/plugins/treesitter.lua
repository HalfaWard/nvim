local languages = {
  'bash',
  'c',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'vim',
  'vimdoc',
  'typescript',
  'javascript',
  'tsx',
}

return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0,
    build = ':TSUpdate',
    opts = {
      ensure_installed = languages,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    -- opts = {
    --   textobjects = {
    --     move = {
    --       enable = true,
    --       set_jumps = true,
    --       goto_next_start = {
    --         ["<C-j>"] = "@function.outer",
    --       },
    --       goto_previous_start = {
    --         ["<C-k>"] = "@function.outer",
    --       },
    --     }
    --   }
    -- }
  }
}
