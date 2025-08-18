# Neovim Configuration

A modern Neovim configuration written in Lua, using [packer-style plugin loading](https://neovim.io/doc/user/lua.html) and designed for programming productivity.

## Features

- **Appearance**
  - Onedark theme (warmer style, transparent)
  - Lualine statusline
  - True color support and rounded window borders
- **Navigation**
  - Tmux navigator integration (`<C-h/j/k/l>`)
  - Oil file explorer (`<leader>e`)
  - Mini.pick fuzzy finder (`<leader>ff`, `<leader>fg`, `<leader>fb`, `<leader>fh`)
- **Editing**
  - Autoindent, smartindent, soft tabs
  - Relative line numbers with cursor line/column
  - Incremental search with smart case
- **LSP & Completion**
  - Built-in LSP configuration for multiple languages
  - `nvim-cmp` autocompletion with LuaSnip
  - Formatting with `conform.nvim`
- **Git**
  - `gitsigns.nvim` for in-line git indicators
  - LazyGit integration (`<leader>git`)
- **Extras**
  - Treesitter syntax highlighting
  - Trouble.nvim diagnostics viewer
  - Noice.nvim enhanced command-line UI
  - Colorizer for color codes
  - Autopairs for brackets and quotes

## Keybindings

- `<leader>w` → Save file
- `<leader>q` → Quit
- `<leader>e` → Open Oil file explorer
- `<leader>ff` → Find files
- `<leader>fg` → Live grep
- `<leader>fb` → Find buffers
- `<leader>fh` → Help tags
- LSP:
  - `gd` → Go to definition
  - `K` → Hover
  - `<leader>rn` → Rename
  - `<leader>ca` → Code action
- Git:
  - `<leader>gb` → Blame line
  - `<leader>git` → LazyGit

## Installation

1. Clone this repo to `~/.config/nvim`:

```bash
git clone https://github.com/rishabh181104/neovim.git ~/.config/nvim
