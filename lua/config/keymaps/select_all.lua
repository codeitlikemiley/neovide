-- Normal Mode: Select All
vim.api.nvim_set_keymap("n", "<D-a>", "ggVG", { noremap = true, silent = true })

-- Insert Mode: Escape to Normal Mode, then Select All
vim.api.nvim_set_keymap("i", "<D-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Visual Mode: Select All
vim.api.nvim_set_keymap("v", "<D-a>", "ggVG", { noremap = true, silent = true })

-- Command Line Mode: Escape to Normal Mode, then Select All
vim.api.nvim_set_keymap("c", "<D-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Terminal Mode: Escape to Normal Mode, then Select All
vim.api.nvim_set_keymap("t", "<D-a>", "<C-\\><C-n>ggVG", { noremap = true, silent = true })
