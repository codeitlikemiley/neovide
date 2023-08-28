function cargo_run()
  -- get local current working directory
  local cwd = vim.fn.getenv("NEOVIDE_CWD") or vim.fn.getcwd()
  local folder_name = cwd:match("^.+/(.+)$")

  -- Get the file name without extension to be used in --bin
  local filename = vim.fn.expand("%:r")
  filename = filename:match("^.+/(.+)$")

  -- if main.rs then filename = folder_name
  if filename == "main" then
    filename = folder_name
  end

  -- Construct the cargo test command
  local cmd = "RUSTFLAGS='-A warnings' cargo run -p " .. folder_name .. " --bin " .. filename

  vim.cmd("! " .. cmd)
end
return cargo_run
