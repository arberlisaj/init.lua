-- Leader key
vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)

-- Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

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

-- Save
vim.keymap.set("n", "<leader>w", function()
  vim.cmd("w")
end)

-- Quit
vim.keymap.set("n", "<leader>q", function()
  vim.cmd("q!")
end)

-- Format Java file
vim.api.nvim_create_user_command(
  'Fjava',
  function()
    local filepath = vim.fn.expand('%:p')
    local cmd = { "google-java-format", "-i", filepath }

    vim.fn.jobstart(cmd, {
      on_exit = function(_, code, _)
        if code == 0 then
          vim.cmd('edit')
        else
          print("Failed to format file. Error code: " .. code)
        end
      end,
    })
  end,
  {}
)
