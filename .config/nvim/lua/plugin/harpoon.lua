local function nav_to_file(index)
	return function()
		require("harpoon"):list():select(index)
	end
end
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Harpoon: [a]ppend file",
		},
		{
			"<leader>m",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon: toggle [m]enu",
		},
		{ "<leader>1", nav_to_file(1), desc = "Harpoon: navigate to file 1" },
		{ "<leader>2", nav_to_file(2), desc = "Harpoon: navigate to file 2" },
		{ "<leader>3", nav_to_file(3), desc = "Harpoon: navigate to file 3" },
		{ "<leader>4", nav_to_file(4), desc = "Harpoon: navigate to file 4" },
		{ "<leader>5", nav_to_file(5), desc = "Harpoon: navigate to file 5" },
	},
	opts = {
		settings = {
			sync_on_ui_close = true,
			save_on_toggle = true,
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}

-- local function nav_to_file(num)
-- 	return function()
-- 		require("harpoon.ui").nav_file(num)
-- 	end
-- end
-- return {
-- 	"ThePrimeagen/harpoon",
-- 	dependencies = { { "nvim-lua/plenary.nvim" } },
-- 	keys = {
-- 		{
-- 			"<leader>a",
-- 			function()
-- 				require("harpoon.mark").add_file()
-- 			end,
-- 			desc = "Harpoon: [a]dd file",
-- 		},
-- 		{
-- 			"<leader>m",
-- 			function()
-- 				require("harpoon.ui").toggle_quick_menu()
-- 			end,
-- 			desc = "Harpoon: toggle [m]enu",
-- 		},
-- 		{ "<leader>1", nav_to_file(1), desc="Harpoon: navigate to file 1" },
-- 		{ "<leader>2", nav_to_file(2), desc="Harpoon: navigate to file 2" },
-- 		{ "<leader>3", nav_to_file(3), desc="Harpoon: navigate to file 3" },
-- 		{ "<leader>4", nav_to_file(4), desc="Harpoon: navigate to file 4" },
-- 		{ "<leader>5", nav_to_file(5), desc="Harpoon: navigate to file 5" },
-- 		{ "<leader>6", nav_to_file(6), desc="Harpoon: navigate to file 6" },
-- 	},
-- 	opts = {},
-- }
