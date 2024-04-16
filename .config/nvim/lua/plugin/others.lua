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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "tokyonight",
			},
		},
	},
	{
		-- Add indentation guide lines even on blank lines
		-- Great for non {} based languages like python or Roc
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}
