vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.showcmd = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Markdown
vim.api.nvim_create_augroup("MarkdownTextAutoWidth", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = "MarkdownTextAutoWidth",
  pattern = {"markdown", "text"},
  callback = function()
    vim.opt_local.wrap = true       -- Enable wrap
    vim.opt_local.textwidth = 0     -- Set textwidth to 0 (unlimited)
    vim.opt_local.linebreak = true  -- Prevent breaking words
  end
})
