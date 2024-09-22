return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && npm install',
  ft = 'markdown',
  config = function()
    vim.g.mkdp_auto_start = 1  -- Automatically start preview on entering a markdown file
  end
}

