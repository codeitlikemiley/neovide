local get_rust_test_fn_name = require("utils/get_rust_test_fn_name")

function run_cargo_test()
  -- get local current working directory
  local cwd = vim.fn.getenv("NEOVIDE_CWD") or vim.fn.getcwd()
  local folder_name = cwd:match("^.+/(.+)$")
  -- Get the current line where the cursor is placed

  local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local inside_test_function = false

  for i = cursor_line, 1, -1 do
    local line = lines[i]
    if line:find("fn ") and not inside_test_function then
      local brace_count = 0
      for j = i, #lines do
        for c in lines[j]:gmatch(".") do
          if c == "{" then
            brace_count = brace_count + 1
          elseif c == "}" then
            brace_count = brace_count - 1
            if brace_count == 0 then
              inside_test_function = cursor_line >= i and cursor_line <= j
              break
            end
          end
        end
        if brace_count == 0 then
          break
        end
      end
      break
    end
  end

  -- Get the file name without extension to be used in --bin
  local filename = vim.fn.expand("%:r")
  filename = filename:match("^.+/(.+)$")

  local function_name = get_rust_test_fn_name()

  -- if main.rs then filename = folder_name
  if filename == "main" then
    filename = folder_name
  end

  -- Construct the cargo test command
  local cmd = "RUSTFLAGS='-A warnings' cargo nextest run -p " .. folder_name .. " --bin " .. filename

  if inside_test_function and function_name then
    cmd = cmd .. " -- tests::" .. function_name
  end

  vim.cmd("! " .. cmd)
end
 return run_cargo_test