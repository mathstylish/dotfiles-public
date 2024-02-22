return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascriptreact = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			html = { "htmlbeautifier" },
			css = { { "prettierd", "prettier" } },
			sass = { { "prettierd", "prettier" } },
			yml = { "yamlfix" },
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
