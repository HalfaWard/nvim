return {
  "fei6409/log-highlight.nvim",
  event = "BufReadPre",
  config = function ()
    require("log-highlight").setup({})
  end,
}
