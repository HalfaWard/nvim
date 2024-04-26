return {
    "cbochs/portal.nvim",
    dependencies = {
        "cbochs/grapple.nvim",
        "theprimeagen/harpoon",
    },
    keys = {
        { "<leader>i", mode = "n", "<cmd>Portal jumplist backward<cr>" },
        { "<leader>o", mode = "n", "<cmd>Portal jumplist forward<cr>" },
    }
}
