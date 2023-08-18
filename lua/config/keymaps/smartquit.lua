vim.keymap.set("n", "qq", '<cmd>lua require("utils/smartquit")()<CR>', { silent = true, desc = "Smart Quit" })

if vim.fn.has('macunix') == 1 and vim.fn.exists('neovide') == 1 then
    vim.keymap.set("n", "<D-q>", '<cmd>qa<cr>', { silent = true, desc = "Quit all" })
end
