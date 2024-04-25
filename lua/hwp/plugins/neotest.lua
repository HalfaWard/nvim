return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    -- require("neotest-plenary"),
                    -- require("neotest-vim-test")({
                        -- ignore_file_types = { "python", "vim", "lua" },
                    -- }),
                    -- require("neotest-dotnet"),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
        end,
    },
}
