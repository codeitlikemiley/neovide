return {
  "echasnovski/mini.starter",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
      "   ██████╗  ██████╗ ██╗     ██████╗  ██████╗ ██████╗ ██████╗ ███████╗██████╗ ███████╗ ",
      "  ██╔════╝ ██╔═══██╗██║     ██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝ ",
      "  ██║  ███╗██║   ██║██║     ██║  ██║██║     ██║   ██║██║  ██║█████╗  ██████╔╝███████╗ ",
      "  ██║   ██║██║   ██║██║     ██║  ██║██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗╚════██║ ",
      "  ╚██████╔╝╚██████╔╝███████╗██████╔╝╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║███████║ ",
      "   ╚═════╝  ╚═════╝ ╚══════╝╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝ ",
    }, "\n")

    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
      new_section("Find file",    "Telescope find_files", "Telescope"),
      new_section("Recent files", "Telescope oldfiles",   "Telescope"),
      new_section("Grep text",    "Telescope live_grep",  "Telescope"),
      new_section("init.lua",     "e $MYVIMRC",           "Config"),
      new_section("Lazy",         "Lazy",                 "Config"),
      new_section("New file",     "ene | startinsert",    "Built-in"),
      new_section("Quit",         "qa",                   "Built-in"),
      new_section("Session restore", [[lua require("persistence").load()]], "Session"),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(pad .. "░ ", false),
      starter.gen_hook.aligning("center", "center"),
    },
    }
    return config
  end,
}
