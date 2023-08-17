-- Move Lines using Opt + [j,k] on Neovide Only
if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  vim.keymap.set("n", "∆", ":m .+1<CR>==", { silent = true, desc = "Move Line Down with OPT + j" })
  vim.keymap.set("n", "˚", ":m .-2<CR>==", { silent = true, desc = "Move Line Up with OPT + k" })
  vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "Move Line Down with OPT +j" })
  vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "Move Line Up with OPT + k" })
  vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move Line Down with OPT + j" })
  vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move Line Up with OPT + k" })
end
