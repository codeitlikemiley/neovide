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



local modes = { 'n', 'o', 'x' }
for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, '<S-h>', '^', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(mode, '<S-l>', 'g_', { noremap = true, silent = true })
end