-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Telescope
vim.keymap.set("n", "<leader>fs", "<cmd> Telescope symbols<cr>", { desc = "Find Symbols/Smileys" })

-- toggle Neotree on right side
vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal right<CR>", { desc = "toggle Neotree on right side" })
