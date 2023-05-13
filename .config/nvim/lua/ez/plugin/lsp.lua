return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'recommended',
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })

      -- may be usefull sometime
      -- vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})

      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
      vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_prev)
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    -- Make sure you setup `cmp` after lsp-zero
    local cmp = require('cmp')
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.setup({
      mapping = {
        -- `Enter` key to confirm completion
        ['<C-Space>'] = cmp.mapping.confirm({ select = false }),
      }
    })

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    require "lsp_signature".setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    })

    -- require('lspconfig').omnisharp.setup({
    --     server_capabilities = {
    --         semanticTokensProvider = {
    --             full = vim.empty_dict(),
    --             legend = {
    --                 tokenModifiers = { "static_symbol" },
    --                 tokenTypes = {
    --                     "comment",
    --                     "excluded_code",
    --                     "identifier",
    --                     "keyword",
    --                     "keyword_control",
    --                     "number",
    --                     "operator",
    --                     "operator_overloaded",
    --                     "preprocessor_keyword",
    --                     "string",
    --                     "whitespace",
    --                     "text",
    --                     "static_symbol",
    --                     "preprocessor_text",
    --                     "punctuation",
    --                     "string_verbatim",
    --                     "string_escape_character",
    --                     "class_name",
    --                     "delegate_name",
    --                     "enum_name",
    --                     "interface_name",
    --                     "module_name",
    --                     "struct_name",
    --                     "type_parameter_name",
    --                     "field_name",
    --                     "enum_member_name",
    --                     "constant_name",
    --                     "local_name",
    --                     "parameter_name",
    --                     "method_name",
    --                     "extension_method_name",
    --                     "property_name",
    --                     "event_name",
    --                     "namespace_name",
    --                     "label_name",
    --                     "xml_doc_comment_attribute_name",
    --                     "xml_doc_comment_attribute_quotes",
    --                     "xml_doc_comment_attribute_value",
    --                     "xml_doc_comment_cdata_section",
    --                     "xml_doc_comment_comment",
    --                     "xml_doc_comment_delimiter",
    --                     "xml_doc_comment_entity_reference",
    --                     "xml_doc_comment_name",
    --                     "xml_doc_comment_processing_instruction",
    --                     "xml_doc_comment_text",
    --                     "xml_literal_attribute_name",
    --                     "xml_literal_attribute_quotes",
    --                     "xml_literal_attribute_value",
    --                     "xml_literal_cdata_section",
    --                     "xml_literal_comment",
    --                     "xml_literal_delimiter",
    --                     "xml_literal_embedded_expression",
    --                     "xml_literal_entity_reference",
    --                     "xml_literal_name",
    --                     "xml_literal_processing_instruction",
    --                     "xml_literal_text",
    --                     "regex_comment",
    --                     "regex_character_class",
    --                     "regex_anchor",
    --                     "regex_quantifier",
    --                     "regex_grouping",
    --                     "regex_alternation",
    --                     "regex_text",
    --                     "regex_self_escaped_character",
    --                     "regex_other_escape",
    --                 },
    --             },
    --             range = true
    --         }
    --     }
    -- })
    lsp.setup()


    -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  end
}
