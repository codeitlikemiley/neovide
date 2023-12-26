local on_attach = require("config/keymaps/rust-tools")
return {
  "simrat39/rust-tools.nvim",
  dependencies = { "mattn/webapi-vim" },
  lazy = true,
  opts = function()
    local ok, mason_registry = pcall(require, "mason-registry")
    local adapter ---@type any
    if ok then
      -- rust tools configuration for debugging support
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
          or extension_path .. "lldb/lib/liblldb.so"
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    end
    return {
      server = {
        -- all keybindings related to rust is attached to this function
        on_attach = on_attach,
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = false,
        -- rust-analyzer settings
        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
              command = "clippy",
            },
            -- macro expansion configuration
            procMacro = {
              ignored = {
                leptos_macro = {
                  -- optional: --
                  -- "component",
                  "server",
                },
              },
            },
          },
        },
      },
      dap = {
        adapter = adapter,
      },
      tools = {
        reload_workspace_from_cargo_toml = true,
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
    }
  end,
  config = function()
  end,
}
