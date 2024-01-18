return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		padding = false,
		multiline = false,
	},
	keys = {
		{
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			{ desc = "Trouble: toggle [W]orkspace diagnostics" },
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			{ desc = "Trouble: toggle [D]ocument diagnostics" },
		},
		{
			"é",
			function()
				require("trouble").open()
				require("trouble").previous({ skip_groups = true })
			end,
			{ desc = "Trouble: previous diagnostics element" },
		},
		{
			"á",
			function()
				require("trouble").open()
				require("trouble").next({ skip_groups = true })
			end,
			{ desc = "Trouble: next diagnostics element" },
		},
	},
	config = function(_, opts)
		require("trouble").setup(opts)
	end,
}
