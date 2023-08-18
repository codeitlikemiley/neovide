if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
  vim.keymap.set("n", "<D-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true, desc = "Go to Tab 1" })
  vim.keymap.set("n", "<D-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true, desc = "Go to Tab 2" })
  vim.keymap.set("n", "<D-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true, desc = "Go to Tab 3" })
  vim.keymap.set("n", "<D-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true, desc = "Go to Tab 4" })
  vim.keymap.set("n", "<D-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true, desc = "Go to Tab 5" })
  vim.keymap.set("n", "<D-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true, desc = "Go to Tab 6" })
  vim.keymap.set("n", "<D-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true, desc = "Go to Tab 7" })
  vim.keymap.set("n", "<D-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true, desc = "Go to Tab 8" })
  vim.keymap.set("n", "<D-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true, desc = "Go to Tab 9" })
  vim.keymap.set("n", "<D-n>", "<cmd>enew<cr>", { silent = true, desc = "New File" })
end
