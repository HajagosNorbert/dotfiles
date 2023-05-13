return {
    {
        'rose-pine/neovim',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },


    {
        'windwp/nvim-ts-autotag',
        dependencies = { { 'nvim-treesitter/nvim-treesitter' } },
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                enable_moveright = false,
            }
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
}
