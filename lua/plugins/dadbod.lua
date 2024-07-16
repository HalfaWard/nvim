return {
  "kristijanhusak/vim-dadbod-ui",
  event = "BufReadPre",
  dependencies = {
    {
      "tpope/vim-dadbod",
      lazy = true,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      lazy = true,
      ft = { "sql", "mysql", "plsql", "sqlite" },
    },
    keys = {
      { "n", "<leader>dd", "<cmd>DBUIToggle<CR>", { noremap = true, silent = true } },
      { "n", "<leader>du", "<cmd>DBUIAddConnection<CR>", { noremap = true, silent = true } },
      { "n", "<leader>de", "<cmd>DBUIAddConnection<CR>", { noremap = true, silent = true } },
      { "n", "<leader>ds", "<cmd>DBUIShowServerExplorer<CR>", { noremap = true, silent = true } },
      { "n", "<leader>dp", "<cmd>DBUIFindBuffer<CR>", { noremap = true, silent = true } },
      { "n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", { noremap = true, silent = true } },
      { "n", "<leader>dl", "<cmd>DBUILastQueryInfo<CR>", { noremap = true, silent = true } },
      { "n", "<leader>dn", "<cmd>DBUINextQueryInfo<CR>", { noremap = true, silent = true } },
      { "n", "<leader>dm", "<cmd>DBUIMostRecentQueryInfo<CR>", { noremap = true, silent = true } },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_table_helpers = {
        sqlserver = {
          List = "select * from {table}",
          Count = "select count(*) from {table}",
        }
      }
    end,
    lazy = true,
  }
}
