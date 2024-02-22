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

local rose_pine = {
	"rose-pine/neovim",
	as = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[ colorscheme rose-pine ]])
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd([[ colorscheme catppuccin ]])
	end,
}

return {
	-- solarized_osaka,
	-- rose_pine,
	catppuccin,
}
