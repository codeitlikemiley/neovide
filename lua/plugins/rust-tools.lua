local on_attach = require("config/keymaps/rust-tools")
return {
  "simrat39/rust-tools.nvim",
  dependencies = { "mattn/webapi-vim" },
  lazy = true,
  opts = {
    server = {
      -- all keybindings related to rust is attached to this function
      on_attach = on_attach,
      -- standalone file support
      -- setting it to false may improve startup time
      standalone = false,
    },
    dap = {
      adapter = {
        type = "executable",
        command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
        name = "rt_lldb",
      },
    },
    tools = {
      on_initialized = function()
        vim.cmd([[
               augroup RustLSP
                 autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                 autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                 autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
               augroup END
             ]])
      end,
    },
  },
}
