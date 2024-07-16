return {
  "fei6409/log-highlight.nvim",
  event = "BufReadPre",
  ft = { "log" },
  config = function ()
    require("log-highlight").setup({})
  end,
}
