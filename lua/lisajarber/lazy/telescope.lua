return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- was: tag = "0.1.5"
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  cmd = "Telescope",
  keys = {
    { '<leader>p', function() require('telescope.builtin').find_files() end },
    { '<C-p>', function() require('telescope.builtin').git_files() end },
    { '<leader>cmd', function() require('telescope.builtin').help_tags() end },
    { '<leader>gr', function()
      local word = vim.fn.expand("<cword>")
      require('telescope.builtin').grep_string({ search = word })
    end },
  },
  config = function()
    require('telescope').setup({})
  end
}
