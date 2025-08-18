# r181104 Neovim — Batteries‑Included ⚡

> A fast, friendly, *Lua‑powered* Neovim setup with great defaults, sensible keymaps, and a curated set of plugins for coding, writing, and tinkering — with icons, emojis, and ✨ polish.

---

## Table of Contents

* [Why this config?](#why-this-config)
* [Feature tour](#feature-tour)
* [Screenshots](#screenshots)
* [Quick start](#quick-start)
* [Requirements](#requirements)
* [Keymaps (cheatsheet)](#keymaps-cheatsheet)
* [Plugin stack](#plugin-stack)
* [Configuration layout](#configuration-layout)
* [LSP, DAP & Formatting](#lsp-dap--formatting)
* [Customization guide](#customization-guide)
* [Updating & maintenance](#updating--maintenance)
* [Troubleshooting FAQ](#troubleshooting-faq)
* [Credits](#credits)

---

## Why this config?

**Beginner‑friendly, fast, and practical.** If you’re new to Neovim, this repository gives you a fully working IDE‑like experience out of the box — **without** overwhelming you. If you’re experienced, it’s a tidy baseline you can extend.

**Highlights**

* 🔤 **Readable UI**: Onedark (warmer) theme with transparent background, crisp UI, and a clean **lualine** statusline.
* 🧭 **Navigation first**: `tmux`‑style window moves, **Oil** for lightweight file browsing, and **mini.pick** for ultra‑fast fuzzy finding.
* 🧠 **Smart editing**: relative numbers, cursorline/column, smart case search, autopairs, and color previews.
* 🧩 **Language smarts**: LSP set‑up for common languages, **nvim‑cmp** + **LuaSnip** completion, and formatter integration via **conform.nvim**.
* 🌳 **Syntax you can trust**: **Treesitter** for accurate, colorful highlighting.
* 🔎 **Diagnostics made easy**: **trouble.nvim** and a more pleasant cmdline/notifications UI via **noice.nvim**.
* 🐙 **Git built‑in**: **gitsigns.nvim** for inline git hints + handy **LazyGit** binding.

> 🧰 Everything is **lazy‑loaded** so startup stays snappy.

---

## Quick start

> **Back up** any existing config first: `mv ~/.config/nvim ~/.config/nvim.bak`

**Linux / macOS**

```bash
# Clone into your Neovim config
git clone https://github.com/r181104/neovim ~/.config/nvim

# First launch – plugins will install automatically
nvim
```

**Windows (PowerShell)**

```powershell
# Close all Neovim instances first
$dest = "$env:LOCALAPPDATA\nvim"
if (Test-Path $dest) { Rename-Item $dest "$dest.bak" }

git clone https://github.com/r181104/neovim $dest
nvim
```

> ⏱ On first run, the plugin manager will sync and install everything.&#x20;

---

## Requirements

* **Neovim** ≥ 0.12 (tested on 0.12+)
* **Git**
* **Nerd Font** for icons (e.g. *FiraCode Nerd Font*, *JetBrains Mono Nerd Font*)
* **ripgrep** (`rg`) for live grep
* **fd** (optional) for faster file search
* **LazyGit** (optional) if you want the `<leader>git` binding
* Language tooling as needed: Node.js, Python 3, Go, Rust, etc.

On Debian/Ubuntu:

```bash
sudo apt install ripgrep fd-find
# fd-find installs as fdfind – consider: sudo ln -s $(which fdfind) /usr/local/bin/fd
```

On Arch:

```bash
sudo pacman -S ripgrep fd
```

On openSUSE:

```bash
sudo zypper install ripgrep fd
```

---

## Keymaps (cheatsheet)

> `<leader>` is **Space**.

### General

* `⌨️  <leader>w` — save
* `⌨️  <leader>q` — quit
* `⌨️  <Esc>` — clear search highlight
* `⌨️  <C-h/j/k/l>` — move between splits (tmux‑style)

### Files & search

* `📁  <leader>e` — Oil file explorer
* `🗂️  <leader>ff` — find files (mini.pick)
* `🔎  <leader>fg` — live grep (mini.pick)
* `📚  <leader>fb` — buffers (mini.pick)
* `❓  <leader>fh` — help tags (mini.pick)

### LSP (language server)

* `🧭  gd` — go to definition
* `📖  K` — hover docs
* `✏️  <leader>rn` — rename symbol
* `🪄  <leader>ca` — code action

### Git

* `📌  <leader>gb` — blame line (gitsigns)
* `🐙  <leader>git` — open LazyGit

> Tip: press `:` then type part of a command to discover more. `:checkhealth` is your friend.

---

## Plugin stack

> All plugins are configured in Lua and loaded on demand to keep startup fast.

* 🎨 **Theme & UI**

  * `navarasu/onedark.nvim` (warmer; transparency enabled)
  * `nvim-lualine/lualine.nvim` (statusline)
  * `kyazdani42/nvim-web-devicons` (icons – requires Nerd Font)
  * `folke/noice.nvim` + `MunifTanjim/nui.nvim` (better cmdline/messages)
* 🧭 **Navigation & search**

  * `stevearc/oil.nvim` (buffer‑like file explorer)
  * `echasnovski/mini.pick` (fuzzy finder)
* ✍️ **Editing quality of life**

  * `windwp/nvim-autopairs`
  * `norcalli/nvim-colorizer.lua`
  * *(optional)* `echasnovski/mini.surround`, `mini.comment`
* 🌳 **Syntax**

  * `nvim-treesitter/nvim-treesitter`
* 🧠 **LSP & completion**

  * `neovim/nvim-lspconfig`
  * `hrsh7th/nvim-cmp` + `L3MON4D3/LuaSnip` (+ snippet sources)
  * `stevearc/conform.nvim` (formatting)
  * *(optional)* `williamboman/mason.nvim` + `mason-lspconfig.nvim` for managing servers
* 🐙 **Git**

  * `lewis6991/gitsigns.nvim`
  * *(optional)* `jesseduffield/lazygit` (external TUI)
* 🚨 **Diagnostics**

  * `folke/trouble.nvim`

> You can freely swap in alternatives (e.g. Telescope instead of mini.pick) — the config stays clean and modular.

---

## Configuration layout

A quick mental model of what lives where:

```
~/.config/nvim/
├─ init.lua                 -- entry point; bootstraps plugins & core options
├─ lsp/                     -- LSP settings & server setups
│  ├─ <language>.lua        -- per-language tweaks (e.g. lua, ts, py)
│  └─ capabilities.lua      -- shared LSP capabilities
├─ lua/                     -- (if present) plugin configs & helpers
│  ├─ plugins/              -- plugin specs/config
│  └─ utils.lua             -- small helper functions
└─ .luarc.json              -- Lua LS hints for the config itself
```

> Don’t worry if you don’t see every folder above — start simple; add as you grow.

---

## LSP, DAP & Formatting

### Language Servers (LSP)

* Recommended approach: install via **Mason** (`:Mason`) and enable servers you need.
* Popular choices: `lua_ls`, `pyright`/`basedpyright`, `tsserver` (or `typescript-language-server`), `rust_analyzer`, `gopls`, `bashls`, `html`, `cssls`, `jsonls`, `yamlls`, `marksman`.
* Key LSP maps work everywhere (see [Keymaps](#keymaps-cheatsheet)).

### Auto‑completion

* `nvim-cmp` provides completion with snippet expansion via `LuaSnip`.
* Add your favorite sources (buffer, path, LSP, etc.).

### Formatting

* `conform.nvim` runs formatters per filetype (e.g. `prettier`, `stylua`, `black`, `goimports`).
* Format on save is easy to toggle — see the plugin config.

### Debugging (optional)

* If you want DAP later: add `mfussenegger/nvim-dap` + UI and language adapters.

---

## Customization guide

* **Change theme**: swap Onedark for any colorscheme (Catppuccin, Tokyonight, …). Update the theme plugin + call.
* **Icons not showing?** Ensure your terminal uses a Nerd Font. In most terminals you set this in *Preferences → Font*.
* **Keymaps**: tweak in `init.lua` (or `lua/core/keymaps.lua` if you break it out).
* **Plugins**: add/remove in the plugin spec table. Keep lazy‑load triggers so startup stays fast.
* **Transparency**: disable if you prefer a solid background.

---

## Updating & maintenance

* **Update plugins** with your manager’s update command:

  * Lazy: `:Lazy sync` or `:Lazy update`
  * Packer: `:PackerSync`
* **Treesitter parsers**: `:TSUpdate`
* **Check health**: `:checkhealth` and follow any suggestions.

---

## Troubleshooting FAQ

**I opened Neovim and got a bunch of errors.**

* Run `:checkhealth` and resolve missing tools.
* If treesitter fails to compile, make sure you have a compiler toolchain (e.g. `build-essential` on Debian/Ubuntu, `base-devel` on Arch, `gcc` on openSUSE).

**Live grep doesn’t return results.**

* Install `ripgrep` (command `rg` must be in your PATH).

**Icons are squares/tofu.**

* Install a Nerd Font and select it in your terminal profile, then restart the terminal.

**LSP hover/rename not working.**

* Ensure the language server is installed (via Mason or system package manager) and attached to the buffer (`:LspInfo`).

**LazyGit mapping does nothing.**

* Install LazyGit and make sure it’s available on PATH.

**Startup feels slow.**

* Temporarily disable heavy plugins to identify the culprit; confirm lazy‑loads are set by event/ft/cmd.

---

## Credits

* Huge thanks to the maintainers of the plugins used here ❤️
* Inspired by the Neovim community and years of dotfile tinkering.

---

> PRs welcome! If you spot a typo, want a new default, or have a good idea, open an issue or a pull request.

