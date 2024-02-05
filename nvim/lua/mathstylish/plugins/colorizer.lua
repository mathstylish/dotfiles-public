return {
	{
		"NTBBloodbath/color-converter.nvim",
		lazy = false,
		config = function()
			vim.keymap.set(
				"n",
				"<leader>cc",
				"<cmd>lua require'color-converter'.cycle()<CR>",
				{ silent = true, noremap = true }
			)
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({
				"html",
				css = {
					css = true,
					css_fn = true,
				},
				markdown = {
					names = false,
				},
			})
		end,
	},
}
