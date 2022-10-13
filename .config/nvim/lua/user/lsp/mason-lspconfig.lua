local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  "sumneko_lua",
  "cssmodules_ls",
  "cssls",
  "rust_analyzer",
  "html",
  "tsserver",
  "bashls",
  "omnisharp",
  "jsonls",
  "yamlls",
}

mason_lspconfig.setup {
  ensure_installed = servers
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- don't set lspconfig directly for rust, but through rust-tools 
  if server == "rust_analyzer" then
    require("rust-tools").setup {

      tools = {
      },
      server = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        }
      }
    }
    goto continue
  end


  lspconfig[server].setup(opts)
  ::continue::
end
