-- map leader
vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- General
keymap.set("n", "<leader>q", ":qa! <cr>", opts)
keymap.set("n", "<leader>a", "gg<S-v>G", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Window
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-n>", ":tabnew <cr>", opts)
keymap.set("n", "<S-h>", "<cmd> BufferLineCyclePrev <cr>", opts)
keymap.set("n", "<S-l>", "<cmd> BufferLineCycleNext <cr>", opts)
keymap.set("n", "<leader>x", "<cmd> bdelete <cr>", opts)
keymap.set("n", "<C-Up>", ":resize -2 <cr>", opts)
keymap.set("n", "<C-Down>", ":resize +2 <cr>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2 <cr>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2 <cr>", opts)
keymap.set("n", "<leader>sh", ":split <cr>", opts)
keymap.set("n", "<leader>sv", ":vsplit <cr>", opts)

-- Oil.nvim
keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, opts)

-- Telescope
keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <cr>", opts)
keymap.set("n", "<leader>gc", "<cmd> Telescope git_branches <cr>", opts)
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <cr>", opts)
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags  <cr>", opts)

keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		cwd = "~/.config/nvim/",
	})
end, opts)

-- Fugitive
keymap.set("n", "<leader>g", ":vertical Git <cr>", opts)