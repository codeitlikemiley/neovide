local nnoremap = require("utils/nnoremap")

if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  nnoremap("<C-S-R>", ":luafile %<CR>")
end
