return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            require('lsp-zero.cmp').extend()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()
            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },
    {
        "windwp/nvim-autopairs",
        dependencies = 'hrsh7th/nvim-cmp',
        config = function()
            require("nvim-autopairs").setup();
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            require("cmp").event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                opts = {
                    ensure_installed = {}
                },
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        },
        opts = {
            -- custom variable to populate by extensions
            skip_servers_from_autoconf = {}
        },
        config = function(_, opts)
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

                vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
                vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
                vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
                vim.keymap.set('n', 'án', vim.diagnostic.goto_next)
                vim.keymap.set('n', 'áp', vim.diagnostic.goto_prev)
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            lsp.skip_server_setup(opts.skip_servers_from_autoconf)
            lsp.setup()

        end
    },
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            float_border = 'rounded',
            call_servers = 'local',
            configure_diagnostics = false,
            setup_servers_on_start = false,
            set_lsp_keymaps = {
                preserve_mappings = false,
                omit = {},
            },
            manage_nvim_cmp = {
                set_basic_mappings = false,
                set_extra_mappings = false,
                use_luasnip = false,
                set_format = false,
                documentation_window = false,
            },
            handler_opts = {
                border = "rounded"
            }
        }
    }
}
