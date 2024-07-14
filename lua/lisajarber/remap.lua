-- Leader key
vim.g.mapleader = " "

-- Explorer & Formatting
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Move selected line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Advanced scrolling
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-d>zz")

-- Move to next & previous word
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Modify matching word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Call the Execute function
vim.api.nvim_set_keymap('n', '<leader>r', ':lua Execute()<CR>', { noremap = true, silent = true })

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

-- Execute current file based on its extension
function Execute()
  local current_file = vim.fn.expand('%')
  local file_extension = vim.fn.fnamemodify(current_file, ':e')

  if vim.fn.filereadable(current_file) == 1 then
    if file_extension == 'js' then
      vim.cmd('!node ' .. current_file)
    elseif file_extension == 'py' then
      vim.cmd('!python ' .. current_file)
    elseif file_extension == 'lua' then
      vim.cmd('!lua ' .. current_file)
    else
      print('Unknown file extension')
    end
  else
    print('Current file is not readable')
  end
end
