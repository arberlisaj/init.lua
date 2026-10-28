return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GBrowse" },
  keys = {
    { "<leader>gs", vim.cmd.Git },
  },
  config = function()

    local FugitiveGroup = vim.api.nvim_create_augroup("FugitiveGroup", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = FugitiveGroup,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        -- rebase always
        vim.keymap.set("n", "<leader>gp", function()
          vim.cmd.Git({ 'pull', '--rebase' })
        end, opts)
      end,
    })


    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
  end
}
