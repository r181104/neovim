return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
			light_style = "dark", -- The theme is used when the background is set to light
			transparent = true,
			terminal_colors = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
		})
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
