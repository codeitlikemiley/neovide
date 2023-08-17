local function get_rust_test_fn_name()
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

return get_rust_test_fn_name
