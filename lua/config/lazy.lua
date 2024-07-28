local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                               import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    {
      import = "lazyvim.plugins.extras.coding.copilot-chat",
      opts = function()
        local user = vim.env.USER or "User"
        user = user:sub(1, 1):upper() .. user:sub(2)
        return {
          model = "gpt-4o",
          auto_insert_mode = true,
          show_help = true,
          question_header = "  " .. user .. " ",
          answer_header = "  Copilot ",
          window = {
            width = 0.4,
          },
          selection = function(source)
            local select = require("CopilotChat.select")
            return select.visual(source) or select.buffer(source)
          end,
        }
      end
    },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.editor.leap" },
    { import = "lazyvim.plugins.extras.vscode" },
    { import = "lazyvim.plugins.extras.git" },
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      init = function()
        ---@type RustaceanOpts
        vim.g.rustaceanvim = {
          ---@type RustaceanLspClientOpts
          server = {
            default_settings = {
              -- this is override if you have rust-analyzer.json on project root
              ['rust-analyzer'] = {
                checkOnSave = {
                  command = "clippy",
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
                diagnostics = {
                  disabled = { 'unresolved-proc-macro' },
                },
              },
            },
          },
        }
      end,
      lazy = false, -- This plugin is already lazy
    },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
