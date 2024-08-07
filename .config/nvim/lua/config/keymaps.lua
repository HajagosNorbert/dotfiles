local M = {}

M.toggle_quick_fix_list = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move accross word wrap like they were files
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>")
vim.keymap.set("n", "<C-u>", "<C-u>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- Got to get something like this configured inside of zellij and not via vim
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<C-q>j", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-q>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<D-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<D-n>", function ()print("hi") end)
vim.keymap.set("n", "<D-t>", function ()print("hi") end)
vim.keymap.set("n", "<C-z>", function ()print("hi") end)
vim.keymap.set("n", "<D-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-q>", M.toggle_quick_fix_list)


-- vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
