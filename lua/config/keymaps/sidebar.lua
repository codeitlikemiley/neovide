local nnoremap = require("utils/nnoremap")

if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
  nnoremap("<D-`>", "[[:Neotree action=show  toggle=true<CR>]]")
end
