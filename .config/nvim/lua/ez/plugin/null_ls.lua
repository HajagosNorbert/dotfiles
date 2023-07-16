return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
        local null_ls = require("null-ls")

        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.name == "tsserver" then
                    client.resolved_capabilities.document_formatting = false
                end
            end,

            sources = {
                null_ls.builtins.formatting.prettier,
            }
        })
    end,
}
