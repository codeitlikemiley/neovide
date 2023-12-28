if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  vim.keymap.set("n", "<D-F5>", ":luafile $MYVIMRC<CR>", { silent = true, desc = "Reload init.lua" })
end

  vim.keymap.set("n", "<leader>rv", ":luafile $MYVIMRC<CR>", { silent = true, desc = "Reload init.lua" })