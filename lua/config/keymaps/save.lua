-- lazy.nvim already uses ctrl + s to save
if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
  vim.keymap.set({ "i", "v", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
end
