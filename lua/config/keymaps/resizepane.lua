vim.keymap.set("n", "__", ":resize -5<CR>", { silent = true, desc = "Decrease Pane Horizontally"})
vim.keymap.set("n", "++", ":resize +5<CR>", { silent = true, desc = "Increase Pane Horizontally" })
vim.keymap.set("n", "--", ":vertical resize -5<CR>", { silent = true, desc = "Decrease Pane Vertically"})
vim.keymap.set("n", "==", ":vertical resize +5<CR>", { silent = true, desc = "Increase Pane Vertically" })
