vim.keymap.set("n", "__", ":resize -5<CR>", { silent = true, desc = "Decrease Pane Horizontal"})
vim.keymap.set("n", "++", ":resize +5<CR>", { silent = true, desc = "Increase Pane Horizontal"})
vim.keymap.set("n", "--", ":vertical resize -5<CR>", { silent = true, desc = "Decrease Pane Vertical"})
vim.keymap.set("n", "==", ":vertical resize +5<CR>", { silent = true, desc = "Increase Pane Vertical" })
