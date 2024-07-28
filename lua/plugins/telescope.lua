local telescope_builtin = require("telescope.builtin")
-- if nil cwd then get env var called NEOVIDE_CWD
local cwd = vim.fn.getcwd()

local function find_files_on_workspace()
  telescope_builtin.find_files({ cwd = cwd })
end

local function find_document_symbols()
  telescope_builtin.lsp_document_symbols({
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
      "Enum",
    }
  })
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
      "Enum",
    },
  })
end


return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- lua LazyVim.pick("oldfiles")()
    { "<D-p>",  ":lua LazyVim.pick('oldfiles')()<CR>",  desc = "Open Recent Files" },
    { "<D-f3>", ":DiffviewFileHistory %<CR>",           desc = "Diff File History" },
    {
      "<D-f4>",
      function()
        vim.cmd('DiffviewClose')
        vim.cmd('bdelete')
      end,
      desc = "Diff View Close"
    },
    {
      "<D-e>",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Help actions",
    },
    { "<D-o>",     find_document_symbols,          desc = "Go to Symbols on Current Open File" },
    { "<D-t>",     find_dynamic_workspace_symbols, desc = "Go to Workspace Symbols" },
    { "<S-space>", "<cmd>Telescope keymaps<cr>",   desc = "Key Maps" },
  },
}
