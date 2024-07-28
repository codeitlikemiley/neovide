local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

vim.g.rust_clip_command = "xclip -selection clipboard"

if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_refresh_rate_idle = 5

  vim.g.neovide_confirm_quit = true

  vim.g.neovide_input_macos_alt_is_meta = true

  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_window_blurred = true;
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_show_border = true
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_theme = 'auto'
  vim.opt.guifont = "Operator Mono Lig:h14"
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
