return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    init = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>s', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ no_ignore = true, no_ignore_parent = true })<cr>", {desc="find files disregaring .gitignore"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fw', function()
            builtin.grep_string({ search = vim.fn.input("Grep> ") })
        end)
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    end
}
