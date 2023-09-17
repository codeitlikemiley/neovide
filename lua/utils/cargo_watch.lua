function cargo_watch()
  -- Construct the cargo watch command
  local cmd = "cargo watch -c"

  -- open new horizontal split
  vim.cmd(":new")
  -- Open a new terminal buffer and run the command
  vim.cmd(":terminal " .. cmd)
end

return cargo_watch
