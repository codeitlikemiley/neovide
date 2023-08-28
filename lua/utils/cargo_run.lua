function cargo_run()
  -- Get local current working directory
  local cwd = vim.fn.getenv("NEOVIDE_CWD") or vim.fn.getcwd()
  local folder_name = vim.fn.fnamemodify(cwd, ":t")

  -- Get the file name without extension to be used in --bin
  local filename = vim.fn.expand("%:r")
  filename = vim.fn.fnamemodify(filename, ":t")

  -- If main.rs, then filename = folder_name
  if filename == "main" then
    filename = folder_name
  end

  -- Construct the cargo run command
  local cmd = "RUSTFLAGS='-A warnings' cargo run -p " .. folder_name .. " --bin " .. filename

  vim.cmd(":new")
  -- Run the command in the terminal
  vim.cmd(":term " .. cmd)
end

return cargo_run
