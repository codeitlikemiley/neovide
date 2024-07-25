local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)


if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<D-i>", LazyVim.toggle.inlay_hints)
end

vim.keymap.set(
  "n",
  "<D-g>",
  function()
    LazyVim.lazygit({ cwd = LazyVim.root.git() })
  end,
  { desc = "Run `lazygit` on terminal", buffer = bufnr })

vim.keymap.set(
  "n",
  "<D-m>",
  function()
    vim.cmd.RustLsp('expandMacro')
  end,
  { desc = "Rust Expand Macro", buffer = bufnr })

vim.keymap.set(
  "n",
  "<D-y>",
  function()
    vim.cmd.RustLsp('rebuildProcMacros')
  end,
  { desc = "Rust Rebuild Macro", buffer = bufnr })

vim.keymap.set(
  "n",
  "<D-F12>",
  function()
    require("noice").cmd("pick")
  end,
  { desc = "View all Notifications", buffer = bufnr })


vim.keymap.set(
  "n",
  "<F1>",
  function()
    vim.cmd.RustLsp('runnables')
  end,
  { silent = true, desc = "Rust Runnables" })


vim.keymap.set(
  "n",
  "<F3>",
  function()
    vim.cmd.RustLsp('debuggables')
  end,
  { silent = true, desc = "Rust Debuggables" })

vim.keymap.set(
  "n",
  "<F5>",
  function()
    vim.cmd.RustLsp('reloadWorkspace')
  end,
  { silent = true, desc = "Reload Workspace" })


vim.keymap.set(
  "n",
  "<F4>",
  function()
    vim.cmd.RustLsp('parentModule')
  end,
  { silent = true, desc = "Reload Workspace" })
