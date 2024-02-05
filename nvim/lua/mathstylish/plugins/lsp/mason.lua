return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"clangd", -- python3-venv is needed
				"bashls",
				"lua_ls",
				"tsserver",
				"docker_compose_language_service",
				"dockerls",
				"html",
				"cssls",
				"emmet_language_server",
				"marksman",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"prettier", -- prettier formatter
				"eslint_d", -- js/ts linter
				"luacheck", -- lua linter (luarocks is needed)
				"cpplint", -- c/c++ linter
				"codelldb",
				-- "isort", -- python formatter
				-- "black", -- python formatter
				-- "pylint", -- python linter
			},
		})
	end,
}
