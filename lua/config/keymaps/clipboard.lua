if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy on visual mode

  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set("c", "<D-v>", "<C-R>+<Space><BS>") -- Paste command mode
  vim.keymap.set("t", "<D-v>", "<C-R>+") -- Paste terminal mode
  vim.keymap.set("!", "<D-v>", "<C-R>+<Space><BS>") -- Paste on :! mode
end

-- Defaults for all systems, insert replace with F12 since some keyboard dont have it
vim.keymap.set("n", "<S-F12>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<S-F12>", '"+P') -- Paste visual mode
vim.keymap.set("i", "<S-F12>", '<ESC>l"+Pli') -- Paste insert mode
vim.keymap.set("c", "<S-F12>", "<C-R>+<Space><BS>") -- Paste command mode
vim.keymap.set("t", "<S-F12>", "<C-R>+") -- Paste terminal mode
vim.keymap.set("!", "<S-F12>", "<C-R>+<Space><BS>") -- Paste on :! mode
vim.keymap.set("x", "p", [["_dP]]) -- Copy on visual mode