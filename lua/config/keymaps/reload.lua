local nnoremap = require("utils/nnoremap")

if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  nnoremap("<D-r>", ":luafile %<CR>")
end
