local keymap = vim.keymap

-- basic
keymap.set("i", "kj", "<Esc>")
keymap.set("n", "<Esc>", ":nohl<cr>", { silent = true })
keymap.set("n", "<leader>q", ":quit<cr>")
keymap.set("n", "<leader>Q", ":qa!<cr>")
keymap.set("n", "<leader>w", ":write<cr>", { silent = true })

-- better db
keymap.set("n", "db", 'vb"_d')

-- ignore folds
keymap.set("n", "k", "gk")
keymap.set("n", "j", "gj")

-- jump between sections
keymap.set("n", "K", "{")
keymap.set("n", "J", "}")

-- tabs
keymap.set("n", "te", ":enew<cr>")
keymap.set("n", "ts", ":w ")
keymap.set("n", "tw", "<C-w>q")
keymap.set("n", "H", ":bnext<cr>")
keymap.set("n", "L", ":bprev<cr>")

-- split
keymap.set("n", "ss", ":vsplit<cr>")
keymap.set("n", "sv", ":split<cr>")

-- window movement
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- window resizing
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- move line up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- visual indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
