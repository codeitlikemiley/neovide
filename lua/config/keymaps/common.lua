local nnoremap = require("utils/nnoremap")
-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { silent = true })
-- Disable Ctrl +Z
vim.keymap.set("n", "<C-z>", "<nop>", { silent = true })
-- Map Ctrl-W to delete the previous word in insert mode.
vim.keymap.set("i", "<C-w>", "<C-\\><C-o>dB", { silent = true })

