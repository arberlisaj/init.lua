return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>cmd', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>gr', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
  end
}
