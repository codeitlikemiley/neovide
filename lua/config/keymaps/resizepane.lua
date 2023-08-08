local nnoremap = require("utils/nnoremap")

nnoremap("__", ":resize -5<CR>")

nnoremap("++", ":resize +5<CR>")

nnoremap("--", ":vertical resize -5<CR>")

nnoremap("==", ":vertical resize +5<CR>")
