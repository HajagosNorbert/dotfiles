return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        auto_install = true,
        autotag = {
            enable = true,
        },
        ensure_installed = {},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    main = "nvim-treesitter.configs"
}
