-- Leader key
vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Move highlighted line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Goated scrolling
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-d>zz")

-- Next & previous word
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Modify matching words
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Organize imports
vim.keymap.set("n", "<leader><CR>", function()
  vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
end)

-- Source
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Save
vim.keymap.set("n", "<leader>w", function()
  vim.cmd("w")
end)

-- Quit
vim.keymap.set("n", "<leader>q", function()
  vim.cmd("q!")
end)
