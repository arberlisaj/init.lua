return {
  {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu)

      vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>0", function() ui.nav_file(4) end)
    end,
  },
}
