local telescope_builtin = require("telescope.builtin")
local Util = require("lazyvim.util")

-- if nil cwd then get env var called NEOVIDE_CWD
local cwd = vim.fn.getcwd()

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
    { "<M-d>", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<M-S-d>", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    -- add a keymap to browse plugin files
    { "<D-f>", Util.telescope("live_grep"), desc = "Find Everyting on Workspace" },
    { "<M-f>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<D-g>", lazygit, desc = "Open Lazy Git" },
    { "<M-g>", "::DiffviewFileHistory %<CR>", desc = "Diff File History" },
    { "<D-o>", find_dynamic_workspace_symbols, desc = "Go to Symbol on Workspace" },
    { "<M-o>", find_document_symbols, desc = "Go to Symbols on Current Open File" },
    { "<D-p>", find_files_on_workspace, desc = "Open Files on Current Working Directory" },
    { "<M-p>", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<D-e>", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)", mode = { "n", "v", "i" } },
    { "<S-space>", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<D-w>", "<cmd>Telescope buffers<cr>", desc = "Open Files on Current Working Directory" },
  },
}
