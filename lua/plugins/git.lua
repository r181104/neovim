return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ signs = { add = { "+" }, change = { "~" }, delete = { "_" } } })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		config = function() end,
	},
}
