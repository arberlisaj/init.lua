vim.g.mapleader = " "

-- Essentials
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.api.nvim_set_keymap('n', '<leader><CR>', ':Prettier<CR>', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- Scrolling (cursor stays in the middle)
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<C-d>zz")

-- Keeps cursor in the middle when searching for a word
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace every matching word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current document executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

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


function Compile()
  local current_file = vim.fn.expand('%')
  local file_extension = vim.fn.fnamemodify(current_file, ':e')

  if file_extension == 'js' then
    if vim.fn.filereadable(current_file) == 1 then
      vim.cmd('!node ' .. current_file)
    else
      print('Current JavaScript file is not readable')
    end
  elseif file_extension == 'py' then
    if vim.fn.filereadable(current_file) == 1 then
      vim.cmd('!python ' .. current_file)
    else
      print('Current Python file is not readable')
    end
  else
    print('Unknown file extension')
  end
end

-- Run JavaScript file with Node.js
vim.api.nvim_set_keymap('n', '<leader>r', ':lua Compile()<CR>', { noremap = true, silent = true })

