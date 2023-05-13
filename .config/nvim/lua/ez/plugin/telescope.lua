return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    init = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>s', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fw', function()
            builtin.grep_string({ search = vim.fn.input("Grep> ") })
        end)
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
    end
}
