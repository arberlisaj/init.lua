function Color(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "black" })
end

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require('rose-pine').setup({
      disable_background = true,
      styles = {
        italic = false,
      },
    })
    vim.cmd("colorscheme rose-pine")
    Color()
  end
}
