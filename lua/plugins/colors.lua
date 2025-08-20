return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			background = {
				light = "macchiato",
				dark = "mocha",
			},
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			},
			show_end_of_buffer = true,
			term_colors = true,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = { "bold", "italic" },
				keywords = { "bold" },
				strings = { "italic" },
				variables = { "italic" },
				numbers = { "italic" },
				booleans = { "bold" },
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
