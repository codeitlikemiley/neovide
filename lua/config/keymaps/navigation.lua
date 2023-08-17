-- Quick Way to Navigate Pane on Neovide
if vim.fn.has('macunix') == 1 and vim.fn.exists('neovide') == 1 or vim.fn.has('gui_running') == 1 then
  vim.keymap.set("n", "<D-h>", "<C-w>h", { silent = true })
  vim.keymap.set("n", "<D-j>", "<C-w>j", { silent = true })
  vim.keymap.set("n", "<D-k>", "<C-w>k", { silent = true })
  vim.keymap.set("n", "<D-l>", "<C-w>l", { silent = true })
end
-- we already have  to C-h, C-j, C-k, C-l  with lazy.nvim
