return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" }, -- optional; nicer terminal window
  -- Calls require("claudecode").setup() with the default options
  config = true,
  -- Keymaps for controlling Claude Code from Neovim
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume session" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add buffer to context" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Reject diff" },
  },
}
