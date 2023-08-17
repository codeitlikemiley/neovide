local telescope_builtin = require("telescope.builtin")
local Util = require("lazyvim.util")

-- if nil cwd then get env var called NEOVIDE_CWD
local cwd = vim.fn.getenv("NEOVIDE_CWD") or vim.fn.getcwd()

local function find_files_on_workspace()
  telescope_builtin.find_files({ cwd = cwd })
end


local function find_document_symbols()
  telescope_builtin.lsp_document_symbols({ cwd = cwd })
end

local function find_dynamic_workspace_symbols()
  telescope_builtin.lsp_dynamic_workspace_symbols({
    cwd = cwd,
    symbols = {
      "Class",
      "Function",
      "Method",
      "Constructor",
      "Interface",
      "Module",
      "Struct",
      "Trait",
      "Field",
      "Property",
    },
  })
end


local function lazygit()
  Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- add a keymap to browse plugin files
    { "<D-f>", Util.telescope("live_grep"),    desc = "Find Everyting on Workspace" },
    { "<D-g>", lazygit,                        desc = "Open Lazy Git" },
    { "<D-i>", find_document_symbols,          desc = "Go to Symbols on Current Open File" },
    { "<D-o>", find_dynamic_workspace_symbols, desc = "Go to Symbol on Workspace", },
    { "<D-p>", find_files_on_workspace,        desc = "Open Files on Current Working Directory" },
  },
}
