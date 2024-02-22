return {
	-- debugging
	{
		{
			"jay-babu/mason-nvim-dap.nvim",
			event = "VeryLazy",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
			opts = {
				handlers = {},
			},
		},
		{
			"mfussenegger/nvim-dap",
			config = function()
				local keymap = vim.keymap
				local opts = { noremap = true, silent = true }

				opts.desc = "Add breakpoint at line"
				keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)

				opts.desc = "Start or continue the debugger"
				keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", opts)

				opts.desc = "Step over"
				keymap.set("n", "<leader>do", "<cmd>DapStepOver<CR>", opts)

				opts.desc = "Step into"
				keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", opts)

				opts.desc = "Terminate"
				keymap.set("n", "<leader>ds", "<cmd>DapTerminate<CR>", opts)
			end,
		},
		{
			"rcarriga/nvim-dap-ui",
			dependencies = "mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup()
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},
	},

	-- live server
	{
		"barrett-ruth/live-server.nvim",
		build = "npm i -g live-server",
		cmd = { "LiveServerToggle", "LiveServerStart", "LiveServerStop" },
		keys = {
			{
				"<leader>ls",
				function()
					require("live-server").toggle()
				end,
				desc = "Toggle Live Server",
			},
		},
	},

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-t>]],
		},
	},
}
