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

-- Reload buffers changed outside nvim (e.g. by Claude)
vim.opt.autoread = true
vim.api.nvim_create_augroup("AutoRead", {clear = true})
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold", "TermLeave"}, {
  group = "AutoRead",
  callback = function()
    if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end
})

-- Also check every second, since none of the events above fire while you stay
-- in a terminal (e.g. Claude). Buffers with unsaved changes are skipped so no
-- reload prompt pops up while you're typing.
local autoread_timer = vim.uv.new_timer()
autoread_timer:start(1000, 1000, vim.schedule_wrap(function()
  if vim.fn.mode() == "c" or vim.fn.getcmdwintype() ~= "" then
    return
  end
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and not vim.bo[buf].modified then
      vim.cmd("checktime " .. buf)
    end
  end
end))

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
