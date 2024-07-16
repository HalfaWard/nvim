return {
  "stevearc/qf_helper.nvim",
  config = function()
    require("qf_helper").setup()
    vim.keymap.set("n", "<C-N>", "<CMD>QNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-P>", "<CMD>QPrev<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>qf", "<CMD>QFToggle!<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ql", "<CMD>LLToggle!<CR>", { noremap = true, silent = true })
  end,
}
