-- return {
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     init = function ()
--         local harpoon = require("harpoon")
--         harpoon:setup()
--
--         vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
--         vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
--         vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
--         vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
--         vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
--         vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
--         vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
--
--         -- Toggle previous & next buffers stored within Harpoon list
--         vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--         vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
--     end
-- }
return {
  'ThePrimeagen/harpoon',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  keys = {
    { "<leader>a", function() require("harpoon.mark").add_file() end,       desc = "Add file" },
    { "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end },
    { "<leader>1", function() require("harpoon.ui").nav_file(1) end },
    { "<leader>2", function() require("harpoon.ui").nav_file(2) end },
    { "<leader>3", function() require("harpoon.ui").nav_file(3) end },
    { "<leader>4", function() require("harpoon.ui").nav_file(4) end },
    { "<leader>5", function() require("harpoon.ui").nav_file(5) end },
    { "<leader>6", function() require("harpoon.ui").nav_file(6) end },
  },
  opts = {},
}

