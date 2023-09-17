-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- Keymaps for quickly moving around panes and resizing panes
require("config/keymaps/navigation") -- navigation panes with [CMD] + [h,j,k,l]
require("config/keymaps/sidebar") -- [CMD] + b to toggle sidebar
require("config/keymaps/split-windows") -- [vsp] and [sp]  split windows
require("config/keymaps/resizepane") -- resize panes with -- . == . __ . and ++
require("config/keymaps/swap") -- delete swap files <leader> [dS]

-- Keymaps for editing , manipulating text
require("config/keymaps/clipboard") -- paste with [CMD] + v , Y to yank whole line
require("config/keymaps/unredo") -- [CMD] + z and [CMD] +y
require("config/keymaps/save") -- [CMD] + s to save
require("config/keymaps/reload") -- [shift] + f5 to reload
require("config/keymaps/movelines") -- [OPT] + j and [OPT] + k to move lines up and down
require("config/keymaps/select_all") -- [OPT] + a to select all

-- manage buffers
require("config/keymaps/smartquit") -- [qq] to smart quit
require("config/keymaps/tabs") -- [CMD] + 1-9 to switch tabs, [CMD] + w to close tab , [CMD] + n to open new tab
require("config/keymaps/buffer_manager") -- [bp, bn, bd ,bq] to manage buffers
-- <leader> fb to open buffer list
-- <leader> b
