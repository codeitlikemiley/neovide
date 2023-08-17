-- lazy.nvim already uses ctrl + s to save
if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
  vim.keymap.set("n", "<D-s>", ":update<CR>", { silent = true, desc = "Save" })
  vim.keymap.set("v", "<D-s>", "<C-C>:update<CR>", { silent = true, desc = "Save" })
  vim.keymap.set("i", "<D-s>", "<C-O>:update<CR>", { silent = true, desc = "Save" })
end
