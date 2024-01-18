return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local nvim_tree = require("nvim-tree")
        local api = require("nvim-tree.api")

        nvim_tree.setup()

        vim.keymap.set("n", "<leader>E", function() api.tree.find_file({ open = true, focus = true }) end,
            { desc = " nvim-tree: find file of current buffer" })
        vim.keymap.set("n", "<leader>e", api.tree.toggle)
    end
}
