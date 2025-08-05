require "nvchad.mappings"

local map = vim.keymap.set
-- add yours here
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

map("i", "jk", "<ESC>")
map("n", "<C-G>", '"_dd', { desc = "Delete Line" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
