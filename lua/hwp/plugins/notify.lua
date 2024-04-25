return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  enabled = true,
  config = function ()
    require("notify").setup({
      background_colour = "#000000",
    })
    vim.notify = require("notify")
  end,
}
