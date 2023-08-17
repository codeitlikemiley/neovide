if vim.fn.has('macunix') == 1 and vim.fn.exists('neovide') == 1 then
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy on visual mode
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
    vim.keymap.set('t', '<D-v>', '<C-R>+')      -- Paste terminal mode
end

vim.keymap.set("n", "<S-F12>", "+p<CR>", { silent = true, desc = "Paste on normal mode" })
vim.keymap.set("!", "<S-F12>", "<C-R>+", { silent = true, desc = "Paste on command mode" })
vim.keymap.set("t", "<S-F12>", "<C-R>+", { silent = true, desc = "Paste on terminal mode" })
vim.keymap.set("", "<S-F12>", "<C-R>+", { silent = true, desc = "Paste on visual mode" })
