if vim.fn.has('macunix') == 1 and vim.fn.exists('neovide') == 1 then
    vim.keymap.set("n", "<D-v>", '"+p', { silent = true, desc = "Paste from clipboard" })
    vim.keymap.set("i", "<D-v>", '<c-r>+', { silent = true, desc = "Paste from clipboard" })
    vim.keymap.set("c", "<D-v>", '<c-r>+', { silent = true, desc = "Paste from clipboard" })
end
-- We dont have Insert Key on mac so we use SHIFT + F12 instead
vim.keymap.set("n", "<S-F12>", '"+p', { silent = true, desc = "Paste from clipboard" })
vim.keymap.set("i", "<S-F12>", '<c-r>+', { silent = true, desc = "Paste from clipboard" })
vim.keymap.set("c", "<S-F12>", '<c-r>+', { silent = true, desc = "Paste from clipboard" })

-- Yank Whole Line
vim.keymap.set("n", "Y", "y$<CR>", { silent = true })
