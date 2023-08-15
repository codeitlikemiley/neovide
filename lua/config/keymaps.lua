-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- import keymaps/save_on_system_clipboard.lua

require("config/keymaps/clipboard")
require("config/keymaps/movelines")
require("config/keymaps/reload")
require("config/keymaps/resizepane")
require("config/keymaps/save")
require("config/keymaps/sidebar")
require("config/keymaps/smartquit")
require("config/keymaps/split-windows")
require("config/keymaps/tabs")
require("config/keymaps/unredo")
require("config/keymaps/cargo_test")
require("config/keymaps/buffer_manager")
-- we can use <leader> fb and <leader> b for buffers
