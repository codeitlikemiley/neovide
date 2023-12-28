local cargo_run = require("utils/cargo_run")
local cargo_bin = require("utils/cargo_bin")

function RustToggleInlayHints()
  if vim.g.rust_inlay_hints_enabled then
    vim.cmd("RustDisableInlayHints")
    vim.g.rust_inlay_hints_enabled = false
  else
    vim.cmd("RustEnableInlayHints")
    vim.g.rust_inlay_hints_enabled = true
  end
end

vim.g.rust_inlay_hints_enabled = true

local custom_attach = function(_, bufnr)
  if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
    -- MacOS Keymaps
    vim.keymap.set("n", "<D-i>", RustToggleInlayHints, { silent = true, desc = "Rust Toggle Inlay Hints" })
    vim.keymap.set("n", "<D-m>", ":RustExpandMacro<CR>", { silent = true, desc = "Expand Rust Macro" })
    vim.keymap.set("n", "<D-y>", ":RustParentModule<CR>", { silent = true, desc = "Rust Parent Module" })
  elseif
      vim.fn.has("unix") == 1 and vim.fn.exists("neovide") == 1
      or vim.fn.has("win32") and vim.fn.exists("neovide") == 1
  then
    -- Windows and Linux Keymaps
    vim.keymap.set("n", "<M-r>", cargo_run, { silent = true, desc = "Rust Run App" })
    vim.keymap.set("n", "<M-w>", cargo_bin, { silent = true, desc = "Run All your Installed Cargo Commands" })
    vim.keymap.set("n", "<M-y>", ":RustParentModule<CR>", { silent = true, desc = "Rust Parent Module" })
    vim.keymap.set("n", "<M-i>", ":RustToggleInlayHints<CR>", { silent = true, desc = "Rust Toggle Inlay Hints" })
    vim.keymap.set("n", "<M-m>", ":RustExpandMacro<CR>", { silent = true, desc = "Expand Rust Macro" })
  end
  -- Universal Keymaps

  -- Function keys
  vim.keymap.set("n", "<F1>", ":RustRunnables<CR>", { silent = true, desc = "Rust Runnables" })
  vim.keymap.set("n", "<F3>", ":RustDebuggables<CR>", { silent = true, desc = "Rust Debuggables" })
  vim.keymap.set("n", "<M-r>", cargo_bin, { silent = true, desc = "Execute Cargo Bin" })
  vim.keymap.set("n", "<F5>", ":RustReloadWorkspace<CR>", { silent = true, desc = "Reload Rust Workspace" })


  vim.keymap.set("n", "<leader>rt", ':lua require("neotest").run.run()<CR>', { silent = true, desc = "Cargo Test" })
  vim.keymap.set("n", "<leader>rr", ":RustRunnables<CR>", { silent = true, desc = "Rust Runnables" })
  vim.keymap.set(
    "n",
    "<leader>rl",
    ':lua require("neotest").summary.toggle()<CR>',
    { silent = true, desc = "Test Summary" }
  )

  vim.keymap.set("n", "<leader>rb", cargo_bin, { silent = true, desc = "Run All your Installed Cargo Commands" })
  vim.keymap.set("n", "<leader>rd", ":RustDebuggables<CR>", { silent = true, desc = "Rust Debuggables" })
  vim.keymap.set("n", "<leader>rn", cargo_run, { silent = true, desc = "Cargo Run" })
  vim.keymap.set("n", "<leader>rm", ":RustExpandMacro<CR>", { silent = true, desc = "Expand Rust Macro" })
  vim.keymap.set("n", "<leader>rH", ":RustEnableInlayHints<CR>", { silent = true, desc = "Show Rust Inlay Hint" })
  vim.keymap.set("n", "<leader>rh", ":RustDisableInlayHints<CR>", { silent = true, desc = "Disable Rust Inlay Hint" })
  vim.keymap.set("n", "<leader>rf", ":!dx fmt<CR>", { silent = true, desc = "run Dioxus FMT" })
  vim.keymap.set(
    "n",
    "<leader>ru",
    ":lua require('dapui').toggle(); vim.cmd('Neotree position=right')<CR>",
    { noremap = true, silent = true, desc = "Toggle Debugger UI" }
  )
  vim.keymap.set(
    "n",
    "<leader>rs",
    ':execute "RustStartStandaloneServerForBuffer" | LspStop<CR>',
    { silent = true, desc = "Rust Standalone Server" }
  )
end
return custom_attach
