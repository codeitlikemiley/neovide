local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_refresh_rate_idle = 5

  vim.g.neovide_confirm_quit = true

  vim.g.neovide_input_macos_alt_is_meta = true

  vim.g.neovide_transparency = 0
  vim.g.transparency = 0.95
  vim.g.neovide_background_color = "#0f1119" .. alpha()
  -- vim.opt.guifont = "Operator Mono Lig:h16"
end

if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 then
  -- pressing OPT would not be translated to ALT
  -- Notable example is on `movelines.lua`

  vim.g.neovide_input_macos_alt_is_meta = true
end

-- delete swap files
vim.cmd([[
  command! DeleteSwaps !find $HOME/.local/state/nvim/swap -type f -name "*.sw?" -exec rm {} \;
]])
