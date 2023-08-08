local map = require("utils/map")

-- Move Lines
if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  map("n", "<D-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  map("n", "<D-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  map("i", "<D-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  map("i", "<D-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  map("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  map("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
end
