if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_hide_mouse_when_typing = false

  vim.g.neovide_refresh_rate = 120

  vim.g.neovide_refresh_rate_idle = 5

  vim.g.neovide_confirm_quit = true

  vim.g.neovide_input_macos_alt_is_meta = true
end

if vim.fn.has('macunix') == 1 and vim.fn.exists('neovide') == 1 then
  -- pressing OPT would not be translated to ALT
  -- Notable example is on `movelines.lua`

  vim.g.neovide_input_macos_alt_is_meta = false
end
