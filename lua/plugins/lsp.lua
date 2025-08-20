return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.gopls.setup({ capabilities = capabilities })
		lspconfig.rust_analyzer.setup({ capabilities = capabilities })
		lspconfig.pylsp.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.jsonls.setup({ capabilities = capabilities })
		lspconfig.eslint.setup({ capabilities = capabilities })
		lspconfig.nixd.setup({ capabilities = capabilities })
		lspconfig.hyprls.setup({ capabilities = capabilities })
	end,
}
