return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
		lazy = false,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		-- TODO: more config here
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		-- TODO: more conf
		opts = {
			options = {
				theme = "onedark",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		-- Add indentation guide lines even on blank lines
		-- Great for non {} based languages like python or Roc
		-- TODO: highlight where I am
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
}
