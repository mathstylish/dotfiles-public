return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },
			c = { "cpplint" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			css = { "stylelint" },
			-- python = { "pylint" },
		}

		-- luacheck customization
		lint.linters.luacheck.args = {
			"--formatter",
			"plain",
			"--codes",
			"--ranges",
			"-",
			"--globals",
			"vim",
			"--no-unused",
		}

		-- cpplint customization
		lint.linters.cpplint.args = {
			"--filter=-legal/copyright,-build/include_subdir",
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
