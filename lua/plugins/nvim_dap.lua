return {
  "mfussenegger/nvim-dap",
  -- Note press <leader> d  , is used for debugging in dap , so no need to map it here
  keys = function()
    -- Mac Specific Keymaps
    if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 and vim.fn.has("gui_running") == 1 then
      vim.keymap.set("n", "<D-d>", ":DapToggleBreakpoint<CR>", { silent = true, desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<D-F1>", ":DapStepOver<CR>", { silent = true, desc = "Step Over" })
      vim.keymap.set("n", "<D-F2>", ":DapStepInto<CR>", { silent = true, desc = "Step Into" })
      vim.keymap.set("n", "<D-F3>", ":DapStepOut<CR>", { silent = true, desc = "Step Out" })
      vim.keymap.set("n", "<D-F4>", ":DapContinue<CR>", { silent = true, desc = "Debug Continue" })
      vim.keymap.set("n", "<D-F5>", ":DapTerminate<CR>", { silent = true, desc = "Debug End" })
      -- Windows / Linux Specific Keymaps
    elseif
      vim.fn.has("unix") == 1 and vim.fn.exists("neovide")
      or vim.fn.has("win32")
        and vim.fn.has("gui_running") == 1
        and vim.fn.exists("neovide") == 1
        and vim.fn.has("gui_running")
    then
      vim.keymap.set("n", "<M-x>", ":DapToggleBreakpoint<CR>", { silent = true, desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<M-F1>", ":DapStepOver<CR>", { silent = true, desc = "Step Over" })
      vim.keymap.set("n", "<M-F2>", ":DapStepInto()<CR>", { silent = true, desc = "Step Into" })
      vim.keymap.set("n", "<M-F3>", ":DapStepOut<CR>", { silent = true, desc = "Step Out" })
      vim.keymap.set("n", "<M-F4>", ":DapContinue<CR>", { silent = true, desc = "Debug Continue" })
      vim.keymap.set("n", "<M-F5>", ":DapTerminate<CR>", { silent = true, desc = "Dap End" })
    end
    -- Universal Keymaps
    vim.keymap.set(
      "n",
      "<D-`>",
      ":lua require('dapui').toggle(); vim.cmd('Neotree position=right')<CR>",
      { noremap = true, silent = true }
    )
  end,
}
