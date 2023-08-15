-- Function to run the test command
function run_cargo_test()
  -- get local current working directory
  local cwd = vim.fn.getcwd()
  -- modify it we only need the folder name eg. /home/user/folder_name
  -- to folder_name
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

  local function_name = get_test_function_name()

   -- if main.rs then filename = folder_name
   if filename == "main" then
     filename = folder_name
   end

  -- Construct the cargo test command
  local cmd = "cargo test --package " .. folder_name .. " --bin " .. filename

  if inside_test_function and function_name then
    cmd = cmd .. " -- tests::" .. function_name .. " --exact --nocapture -q"
  else
    cmd = cmd .. " -- --exact --nocapture -q"
  end

  -- cargo test --package topic_on_rust --bin name -- tests::test_first_name --exact --nocapture
  -- cargo test --package rust-grpc-server --bin rust-grpc-server -- tests::test_check_auth --exact --nocapture

  -- Run the command in terminal
  vim.cmd("! " .. cmd)
end

function get_test_function_name()
  local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Iterate through the lines to find #[test]
  for i = 1, #lines do
    if lines[i]:find("#%[test%]") then
      -- Check if the cursor is at or below the #[test] line
      if cursor_line >= i then
        -- Extract the function name from the next line
        local function_line = lines[i + 1]
        local function_name_start = function_line:find("fn") + 3
        local function_name_end = function_line:find("%(", function_name_start) - 1
        local test_function_name = function_line:sub(function_name_start, function_name_end)
        local brace_count = 0
        -- Iterate through the lines to find the function's body range
        for j = i + 1, #lines do
          for c in lines[j]:gmatch(".") do
            if c == "{" then
              brace_count = brace_count + 1
            elseif c == "}" then
              brace_count = brace_count - 1
              -- Check if the cursor is within the function's body range
              if brace_count == 0 and cursor_line <= j then
                return test_function_name
              end
            end
          end
        end
      end
    end
  end
  return nil
end

vim.api.nvim_set_keymap("n", "<D-S-r>", [[:lua run_cargo_test()<CR>]], { noremap = true, silent = true })
