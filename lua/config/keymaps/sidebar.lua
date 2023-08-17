if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
  vim.keymap.set("n", "<D-b>", ":Neotree action=show toggle=true position=left<CR>", { silent = true, desc = "Toggle Sidebar" })
end
