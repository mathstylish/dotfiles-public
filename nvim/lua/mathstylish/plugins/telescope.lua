return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
			},
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make CC=gcc" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
							["<C-j>"] = actions.preview_scrolling_down,
							["<C-k>"] = actions.preview_scrolling_up,
							["o"] = actions.select_default,
						},
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								-- your custom normal mode mappings
								["a"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["o"] = actions.select_default,
								["v"] = actions.select_vertical,
								["s"] = actions.select_horizontal,
							},
						},
					},
				},
			})

			telescope.load_extension("file_browser")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					no_ignore = false,
					file_ignore_patterns = {
						".git/.*",
					},
					hidden = true,
					layout_config = {
						width = 0.75,
						horizontal = {
							preview_width = 0.55,
						},
					},
				})
			end)
			vim.keymap.set("n", "<leader>ft", function()
				builtin.live_grep()
			end)
			vim.keymap.set("n", "<leader>fb", function()
				builtin.buffers()
			end)
			vim.keymap.set("n", "<leader>fh", function()
				builtin.man_pages()
			end)
			vim.keymap.set("n", ";;", function()
				builtin.resume()
			end)
			vim.keymap.set("n", "<leader>fd", function()
				builtin.diagnostics()
			end)
			vim.keymap.set("n", "<leader>e", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 30 },
				})
			end)

			telescope.load_extension("fzf")
		end,
	},
}
