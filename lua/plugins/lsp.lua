return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  -- modify lsp keymaps
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
      keys[#keys + 1] =
        { "<D-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
    else
      keys[#keys + 1] =
        { "<C-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
    end
    -- end modifying lsp keymaps
  end,
  --  Modify other LSP  settings below this line
}
