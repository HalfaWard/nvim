return {
  'windwp/nvim-ts-autotag',
  event = "BufReadPre",
  ft = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'svelte',
    'html',
  },
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
