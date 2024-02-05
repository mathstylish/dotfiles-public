local solarized_osaka = {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		require("solarized-osaka").setup({
			styles = {
				floats = "transparent",
			},
		})
		vim.cmd([[ colorscheme solarized-osaka ]])
	end,
}

return {
	solarized_osaka,
}
