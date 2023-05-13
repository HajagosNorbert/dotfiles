return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = true
    },

    {
        "windwp/nvim-autopairs",
        config = true
    },

    {
        'numToStr/Comment.nvim',
        config = true
    }
}
