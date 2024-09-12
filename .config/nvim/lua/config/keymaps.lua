-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Standard remaps
--
-- Centering
-- Scrolling with C-d and C-u will now keep the cursor in the middle (QoL)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Searchresults will now be centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- ##########   PLUGINS   ##########
-- Telescope
vim.keymap.set("n", "<leader>fs", "<cmd> Telescope symbols<CR>", { desc = "Find Symbols/Smileys" })

vim.keymap.set("n", "<leader>flg", "<cmd> Telescope live_grep<CR>", {})

-- NeoTree
vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal right<CR>", { desc = "toggle Neotree on right side" })

-- tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navigate to left Window" })

vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navigate to right Window" })

vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Navigate to down Window" })

vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Navigate to up Window" })
