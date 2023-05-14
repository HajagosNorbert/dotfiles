local function get_codelldb()
    local mason_registry = require "mason-registry"
    local codelldb = mason_registry.get_package "codelldb"
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    return codelldb_path, liblldb_path
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "rust" })
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "codelldb" })
        end,
    },
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            "neovim/nvim-lspconfig",
            opts = function(_, opts)
                vim.list_extend(opts.skip_servers_from_autoconf, { "rust_analyzer" })
            end,
        },
        config = function()
            local rust_tools = require('rust-tools')
            local codelldb_path, liblldb_path = get_codelldb()

            rust_tools.setup({
                tools = {
                    on_initialized = function()
                        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                            pattern = { "*.rs" },
                            callback = function()
                                local _, _ = pcall(vim.lsp.codelens.refresh)
                            end,
                        })
                    end,
                },
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set('n', '<leader>K', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<leader>cl", function() vim.lsp.codelens.run() end,
                            { buffer = bufnr, desc = "Code Lens" })
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            lens = {
                                enable = true,
                            },
                            checkOnSave = {
                                enable = true,
                                command = "clippy",
                            },
                        },
                    },
                },
                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            })
        end
    }
}
