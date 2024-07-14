-- plugins.lua or init.lua
return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        formatting.prettier,
      },
    })
  end,
}
