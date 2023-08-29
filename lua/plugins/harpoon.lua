return {
	{
		"theprimeagen/harpoon",
		keys = {
			{
				"<leader>hh",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "File Menu",
			},
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Add File",
			},
			{
				"<leader>hs",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Nav File 1",
			},
			{
				"<leader>hd",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Nav File 2",
			},
			{
				"<leader>hf",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Nav File 3",
			},
			{
				"<leader>hg",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Nav File 4",
			},
		},
		opts = {
			global_settings = {
				save_on_toggle = true,
				enter_on_sendcmd = true,
			},
		},
	},
}
