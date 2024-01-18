vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.o.updatetime = 500
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.breakindent = true

vim.opt.undofile = true

vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.scrolloff = 3

vim.opt.updatetime = 50

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- TODO: do i need this?
vim.filetype.add({
    extension = {
        roc = "roc"
    }
})
