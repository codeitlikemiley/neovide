local nnoremap = require("utils/nnoremap")
local inoremap = require("utils/inoremap")

if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  nnoremap("<D-z>", [[u]])
  inoremap("<D-z>", [[<Esc>: u<CR>]])

  nnoremap("<D-y>", [[<C-r>]])
  inoremap("<D-y>", [[<Esc>:<CR>]])
else
  nnoremap("<C-z>", [[u]])

  nnoremap("<C-y>", [[<C-r>]])
end
