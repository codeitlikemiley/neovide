local cargo_run = require("utils/cargo_run")

return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
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
      taplo = {
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
    },
    setup = {
      rust_analyzer = function(_, opts)
        local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
        require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
        return true
      end,
    },
  },
  -- modify lsp keymaps
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
      keys[#keys + 1] =
      { "<D-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
      -- disable default keymap of CMD + r
      keys[#keys + 1] = { "<D-r>", false }
      keys[#keys + 1] = {
        "<D-r>",
        cargo_run,
        desc = "Cargo Run Under Cursor",
        mode = { "n", "v", "i" },
        has =
        "Cargo Run Under Cursor"
      }
      keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename", mode = { "n", "v", "i" }, has = "rename" }
      keys[#keys + 1] = { "<D-k>", ":DapContinue<CR>", desc = "Debug Continue", mode = { "n", "v", "i" }, has = "Debug Continue" }
    else
      keys[#keys + 1] =
      { "<C-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
      keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end

    -- end modifying lsp keymaps
  end,
  --  Modify other LSP  settings below this line
}
