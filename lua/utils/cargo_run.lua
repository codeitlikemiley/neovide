function cargo_run()
  local cwd = vim.fn.getcwd()

  -- Check if Makefile is present
  local makefile_path = cwd .. "/Makefile"
  local makefile_exists = vim.fn.filereadable(makefile_path) ~= 0

  -- Extract package and binary names from the current directory name
  local package_name = vim.fn.fnamemodify(cwd, ":t")
  local filename = vim.fn.expand("%:r")
  local binary_name = vim.fn.fnamemodify(filename, ":t")

  if binary_name == "main" then
    binary_name = package_name
  end

  -- Read the entire file to check for test context
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local is_test_context = false
  local in_test_module = false
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cursor_line = cursor_pos[1]

  for i, line in ipairs(lines) do
    if line:match("^mod tests {") then
      in_test_module = true
    elseif in_test_module and line:match("^}%s*$") then
      in_test_module = false
    elseif in_test_module and (line:match("#%[test%]") or line:match("#%[cfg%(test%)%]")) and i >= cursor_line - 5 and i <= cursor_line + 5 then
      is_test_context = true
      break
    end
  end

  -- Determine command based on context and Makefile presence
  local cmd
  if is_test_context then
    vim.cmd("lua require('neotest').run.run()")
    return
  elseif makefile_exists then
    -- cmd = "make run PACKAGE=" .. package_name .. " BINARY_NAME=" .. binary_name
    cmd = "make run" .. "BIN=" ..binary_name
  else
    cmd = "RUSTFLAGS='-A warnings' cargo run -p " .. package_name .. " --bin " .. binary_name
  end

  vim.cmd(":new")
  vim.cmd(":term " .. cmd)
end

return cargo_run
