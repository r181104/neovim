-- =============================
-- Neovim Configuration (init.lua)
-- =============================
local vim = vim
-- =============================
-- Basic Options
-- =============================
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.showmode = false
vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "↪"
vim.o.sidescroll = 1

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.o.swapfile = false
vim.o.backup = false

local undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.fn.mkdir(undodir, "p")
vim.o.undodir = undodir
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- =============================
-- Plugins
-- =============================
vim.pack.add({
	-- Lsp and Formatting
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	-- Snippets and Completion
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	-- For better navigation when in tmux
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	-- Just when you don't remember your own keybinds
	{ src = "https://github.com/folke/which-key.nvim" },
	-- Fuzzy finding or searching
	{ src = "https://github.com/echasnovski/mini.pick" },
	-- To get a good looking command line
	{ src = "https://github.com/folke/noice.nvim" },
	-- For colors
	{ src = "https://github.com/navarasu/onedark.nvim" },
	-- To blame
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- For syntax highlighting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	-- For customisation of status bar
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	-- To open lazygit in neovim
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	-- File tree
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	-- Makes us see where something begins and where something ends as well
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Autopairs
	{ src = "https://github.com/windwp/nvim-autopairs", event = "InsertEnter" },
	-- Just so you know what's going on
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	-- To view color as you type them
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
	-- Just wanted to try it don't really know how it works at the moment
	{ src = "https://github.com/folke/trouble.nvim" },
})

-- =============================
-- Plugin Setup
-- =============================
-- Mini.pick
local pick = require("mini.pick")
pick.setup()

-- Autopairs
require("nvim-autopairs").setup({})

-- Trouble
require("trouble").setup({ icons = true })

-- Git signs
require("gitsigns").setup({ signs = { add = { "+" }, change = { "~" }, delete = { "_" } } })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git blame" })

-- Notify
require("notify").setup({ background_colour = "#000000" })

-- Treesitter
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true, additional_vim_regex_highlighting = false },
})

-- Onedark color scheme
require("onedark").setup({
	style = "warmer",
	transparent = true,
	term_colors = true,
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "bold,italic",
		strings = "italic",
		variables = "bold",
	},
	diagnostics = { darker = true, undercurl = true, background = true },
})
require("onedark").load()

-- Lualine
require("lualine").setup({
	options = {
		theme = "onedark",
		style = "warmer",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

-- Noice
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})

-- Oil file explorer
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = { show_hidden = true },
	keymaps = {
		["<CR>"] = { "actions.select", mode = "n", desc = "Open file/directory" },
		["h"] = { "actions.parent", mode = "n", desc = "Go to parent directory" },
		["l"] = { "actions.select", mode = "n", desc = "Open file/directory" },
		["-"] = { "actions.parent", mode = "n", desc = "Go to parent directory (alt)" },
		["_"] = { "actions.open_cwd", mode = "n", desc = "Set cwd to current directory" },
		["<C-v>"] = { "actions.select", opts = { vertical = true }, mode = "n", desc = "Open in vertical split" },
		["<C-x>"] = { "actions.select", opts = { horizontal = true }, mode = "n", desc = "Open in horizontal split" },
		["<C-t>"] = { "actions.select", opts = { tab = true }, mode = "n", desc = "Open in new tab" },
		["<C-p>"] = { "actions.preview", mode = "n", desc = "Preview file" },
		["<C-r>"] = { "actions.refresh", mode = "n", desc = "Refresh directory" },
		["g."] = { "actions.toggle_hidden", mode = "n", desc = "Toggle hidden files" },
		["gx"] = { "actions.open_external", mode = "n", desc = "Open in external program" },
		["q"] = { "actions.close", mode = "n", desc = "Close oil buffer" },
		["<Esc>"] = {
			callback = function()
				if vim.fn.mode() == "n" then
					require("oil.actions").close.callback()
				end
			end,
			mode = "n",
			desc = "Close oil buffer",
		},
		["g?"] = { "actions.show_help", mode = "n", desc = "Show help" },
		["gs"] = { "actions.change_sort", mode = "n", desc = "Change sort order" },
	},
	use_default_keymaps = false,
})

-- =============================
-- LSP Setup
-- =============================
vim.lsp.enable({
	"lua_ls",
	"gopls",
	"rust_analyzer",
	"pylsp",
	"clangd",
	"html",
	"cssls",
	"jsonls",
	"eslint",
	"nixd",
	"hyprls",
})

-- =============================
-- Formatter (Conform)
-- =============================
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		go = { "gofumpt", "goimports" },
		rust = { "rustfmt" },
		nix = { "alejandra" },
		sh = { "shfmt" },
		yaml = { "yamlfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		java = { "google-java-format" },
		sql = { "sqlfmt" },
		hyprlang = { "shfmt" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 500 })
end, { desc = "[F]or[m]at buffer" })

vim.keymap.set("v", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, { desc = "[F]ormat selection" })

-- =============================
-- Colorizer
-- =============================
require("colorizer").setup({
	filetypes = { "*" },
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = true,
		rgb_fn = true,
		rgba_fn = true,
		hsl_fn = true,
		hsla_fn = true,
		css = true,
		css_fn = true,
		names = true,
		tailwind = true,
		sass = { enable = true, parsers = { "css" } },
		mode = "background",
		virtualtext = "■",
		always_update = true,
	},
})

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup({ indent = { highlight = highlight } })

vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- =============================
-- Key Mappings
-- =============================
local map = vim.keymap.set

-- General
map("n", "<leader>so", ":update<CR> :source<CR>")
map("n", "<leader>si", ":update<CR> :source ~/.config/nvim/init.lua <CR>")
map("n", "<leader>w", ":write<CR>", { desc = "Save file" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
map({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })

-- File explorer & LazyGit
map("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open oil file explorer" })
map("n", "<leader>git", ":LazyGit<CR>", { desc = "Open LazyGit" })
map("n", "<leader>ter", ":vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })

-- Tmux navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Move to left split" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Move to below split" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Move to above split" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Move to right split" })

-- Mini.pick
map("n", "<leader>ff", function()
	pick.builtin.files()
end, { desc = "Find files" })
map("n", "<leader>fg", function()
	pick.builtin.grep_live()
end, { desc = "Search text (live grep)" })
map("n", "<leader>fb", function()
	pick.builtin.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fh", function()
	pick.builtin.help()
end, { desc = "Search help tags" })

-- Colorizer toggle
map("n", "<leader>tc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle Colorizer" })

-- Prime's remaps
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- LSP
map("n", "gd", vim.lsp.buf.definition)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>ws", vim.lsp.buf.workspace_symbol)
map("n", "<leader>fd", vim.diagnostic.open_float)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>gr", vim.lsp.buf.references)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>for", vim.lsp.buf.format)
map("n", "<leader>fe", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "<leader>ce", vim.diagnostic.setqflist, { desc = "Diagnostics to quickfix" })

-- Trouble
map("n", "<leader>tt", function()
	require("trouble").toggle()
end)
map("n", "[d", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)
map("n", "]d", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)

-- Completion and Snippets
local ls = require("luasnip")
ls.filetype_extend("javascript", { "jsdoc" })
map({ "i" }, "<C-s>e", function()
	ls.expand()
end, { silent = true })
map({ "i", "s" }, "<C-s>;", function()
	ls.jump(1)
end, { silent = true })
map({ "i", "s" }, "<C-s>,", function()
	ls.jump(-1)
end, { silent = true })
map({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
