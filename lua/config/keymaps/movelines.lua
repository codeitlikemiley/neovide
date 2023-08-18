-- Move Lines using Opt + [j,k] on Neovide Only
if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "Move Line Down with OPT + j" })
  vim.keymap.set("n", "<M-k", ":m .-2<CR>==", { silent = true, desc = "Move Line Up with OPT + k" })
  vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move Line Down with OPT +j" })
  vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move Line Up with OPT + k" })
  vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move Line Down with OPT + j" })
  vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move Line Up with OPT + k" })
end
