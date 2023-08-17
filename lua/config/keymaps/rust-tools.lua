-- Load the run_cargo_test function
require("utils/run_cargo_test")

local custom_attach = function(_, bufnr)
  -- MacOS Keymaps
  if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 and vim.fn.has("gui_running") == 1 then
    vim.keymap.set("n", "<D-R>", ":lua run_cargo_test()<CR>", { silent = true, desc = "Run Cargo Test" })
    vim.keymap.set("n", "<D-i>", ":RustEnableInlayHints<CR>", { silent = true, desc = "Enable Inlay Hints" })
    vim.keymap.set("n", "<D-I>", ":RustDisableInlayHints<CR>", { silent = true, desc = "Disable Inlay Hints" })
    vim.keymap.set("n", "<D-d>", ":DapToggleBreakpoint<CR>", { silent = true, desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<D-g>", ":RustPlay<CR>", { silent = true, desc = "Play Rust" })
    vim.keymap.set("n", "<D-F1>", ":DapContinue<CR>", { silent = true, desc = "Dap Continue" })
    vim.keymap.set("n", "<D-F2>", ":DapStepOver<CR>", { silent = true, desc = "Dap Step Over" })
    vim.keymap.set("n", "<D-F3>", ":DapStepInto<CR>", { silent = true, desc = "Dap Step Into" })
    vim.keymap.set("n", "<D-F4>", ":DapStepOut<CR>", { silent = true, desc = "Dap Step Out" })

  -- Windows and Linux Keymaps
  elseif
      vim.fn.has("unix") == 1 and vim.fn.exists("neovide")
      or vim.fn.has("win32")
      and vim.fn.has("gui_running") == 1
      and vim.fn.exists("neovide") == 1
      and vim.fn.has("gui_running")
  then
    vim.keymap.set("n", "<M-S-r>", ":lua run_cargo_test()<CR>", { silent = true, desc = "Run Cargo Test" })
    vim.keymap.set("n", "<M-i>", ":RustEnableInlayHints<CR>", { silent = true, desc = "Enable Inlay Hints" })
    vim.keymap.set("n", "<M-S-i>", ":RustDisableInlayHints<CR>", { silent = true, desc = "Disable Inlay Hints" })
    vim.keymap.set("n", "<M-d>", ":DapToggleBreakpoint<CR>", { silent = true, desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<M-g>", ":RustPlay<CR>", { silent = true, desc = "Play Rust" })
    vim.keymap.set("n", "<M-F1>", ":DapContinue<CR>", { silent = true, desc = "Dap Continue" })
    vim.keymap.set("n", "<M-F2>", ":DapStepOver<CR>", { silent = true, desc = "Dap Step Over" })
    vim.keymap.set("n", "<M-F3>", ":DapStepInto()<CR>", { silent = true, desc = "Dap Step Into" })
    vim.keymap.set("n", "<M-F4>", ":DapStepOut<CR>", { silent = true, desc = "Dap Step Out" })
  end

  -- Universal Keymaps
  vim.keymap.set("n", "<F1>", ":RustRunnables<CR>", { silent = true, desc = "Rust Runnables" })
  vim.keymap.set("n", "<F3>", ":RustDebuggables<CR>", { silent = true, desc = "Rust Debuggables" })
  vim.keymap.set("n", "<F4>", ":!cargo test -- --ignored<CR>", { silent = true, desc = "Run Ignored Tests" })
  vim.keymap.set("n", "<F5>", ":RustReloadWorkspace<CR>", { silent = true, desc = "Reload Rust Workspace" })

  vim.keymap.set("n", "<leader>rt", ":lua run_cargo_test()<CR>", { silent = true, desc = "Run Cargo Test" })
  vim.keymap.set("n", "<leader>rr", ":RustRunnables<CR>", { silent = true, desc = "Run Cargo Test" })
  vim.keymap.set("n", "<leader>rd", ":RustDebuggables<CR>", { silent = true, desc = "Rust Debuggables" })
  vim.keymap.set("n", "<leader>rm", ":RustExpandMacro<CR>", { silent = true, desc = "Expand Rust Macro" })
  -- Note press <leader> d  , is used for debugging in dap , so no need to map it here

  vim.keymap.set("n", "<leader>rs", ':execute "RustStartStandaloneServerForBuffer" | LspStop<CR>',
    { silent = true, desc = "Rust Start Standalone Server" })
end
return custom_attach
