return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPre",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          accept_line = "<M-L>",
          accept_word = "<M-;>",
          next = "<M-.>",
          prev = "<M-,>",
          dismiss = "<M-'>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
        help = true,
        ["*"] = true,
      },
    })
  end,
}
