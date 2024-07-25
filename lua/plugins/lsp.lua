local cargo_run = require("utils/cargo_run")
local cursor_near_codelens = require("utils/near_codelens")

local function run_code_action_or_codelens()
  if cursor_near_codelens() then
      -- If on a codelens line, you could potentially run a codelens related action here
      vim.lsp.codelens.run()
  else
      vim.lsp.buf.code_action()
  end
end

return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
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
      rust_analyzer = function()
        return true
      end,
    },
  },
  -- modify lsp keymaps
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
      keys[#keys + 1] =
      { "<D-.>", run_code_action_or_codelens, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
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
      keys[#keys + 1] = { "<D-k>", ':lua require("dap").continue()<CR>', desc = "Debug Continue", mode = { "n", "v", "i" }, has =
      "Debug Continue" }
    else
      keys[#keys + 1] =
      { "<C-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
      keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end

    -- end modifying lsp keymaps
  end,
  --  Modify other LSP  settings below this line
}
