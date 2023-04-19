local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
  return
end

local opts = {
  --[[ server = {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    },
  }, ]]

  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
}

-- Commented out to make tsserver work with JS, not just typescript
-- typescript.setup(opts)
