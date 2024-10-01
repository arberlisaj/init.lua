# Personal LazyVim Setup

This repository contains my personal Neovim configuration, built on top of the [LazyVim](https://github.com/LazyVim/LazyVim) framework. LazyVim is a pre-configured Neovim setup that leverages lazy loading for better performance. This documentation provides an overview of the configuration, how to install it, and details on customization.

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [Plugins](#plugins)

## Installation

**Clone the repository** into your Neovim configuration directory:

```bash
git clone https://github.com/arberlisaj/init.lua ~/.config/nvim
```

**Open Neovim** and LazyVim will automatically install the required plugins and set up the environment. To ensure everything is working, you can run:

```bash
:Lazy sync
```

LazyVim uses lazy-loading to improve startup time, so you don’t have to worry about slow initialization.

## Dependencies

Ensure you have the following dependencies installed:

- **Git**: For managing plugins and updates.
- **Luarocks**: Required for managing Lua modules and dependencies.
- **Neovim** (>= 0.8)
- **Node.js**: Needed for some LSP servers and certain plugins (e.g., formatting and linting).

## Plugins

> This configuration is powered by LazyVim’s plugin manager, [lazy.nvim](https://github.com/folke/lazy.nvim), which is optimized for lazy-loading. Here are some key plugins included:

- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder for quick navigation.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting and parsing.
- **[lspconfig](https://github.com/neovim/nvim-lspconfig)**: Pre-configured LSP support for multiple languages.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git integration for line highlighting and status.
