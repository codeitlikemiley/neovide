-- check if the current directory is a valid cargo workspace
function is_workspace(cwd)
    local cargo_toml_path = cwd .. "/Cargo.toml"
    if vim.fn.filereadable(cargo_toml_path) == 0 then
        return false
    end

    local cargo_toml = vim.fn.readfile(cargo_toml_path)
    for _, line in ipairs(cargo_toml) do
        if line:match("^%[workspace%]") then
            return true
        end
    end
    return false
end

-- read the nearest Cargo.toml and return the package name if found
function get_package(file_path)
    local cwd = vim.fn.getcwd()
    local path = file_path

    while true do
        local cargo_toml_path = path .. "/Cargo.toml"
        if vim.fn.filereadable(cargo_toml_path) ~= 0 then
            local cargo_toml = vim.fn.readfile(cargo_toml_path)
            local in_package_section = false
            for _, line in ipairs(cargo_toml) do
                if line:match("^%[") and not line:match("^%[package%]") then
                    in_package_section = false
                end
                if in_package_section then
                    local name_match = line:match('^name%s*=%s*"([^"]+)"') or line:match("^name%s*=%s*([^%s]+)")
                    if name_match then
                        return name_match
                    end
                end
                if line:match("^%[package%]") then
                    in_package_section = true
                end
            end
            -- Cargo.toml found but no package name
            break
        end

        if path == cwd then
            -- Reached the cwd, stop the search
            break
        end

        path = vim.fn.fnamemodify(path, ":h") -- Go up one directory
    end

    return nil -- No Cargo.toml found up to the cwd
end

-- returns the nearest Makefile of the current open file
function get_makefile(file_path)
    local cwd = vim.fn.getcwd()
    local path = file_path

    while path ~= "" and path ~= "." do
        if path == cwd then
            return nil -- Reached the cwd, stop the search
        end

        local makefile_path = path .. "/Makefile"
        if vim.fn.filereadable(makefile_path) ~= 0 then
            return makefile_path
        end

        path = vim.fn.fnamemodify(path, ":h") -- Go up one directory
    end

    return nil -- No Makefile found up to the cwd
end

function is_makefile_valid(makefile_path)
    -- Return false if makefile_path is nil or file is not readable
    if not makefile_path or vim.fn.filereadable(makefile_path) == 0 then
        return false
    end

    local makefile_content = vim.fn.readfile(makefile_path)
    local has_run_target = false
    local has_build_target = false
    for _, line in ipairs(makefile_content) do
        if line:match("^run:") then
            has_run_target = true
        elseif line:match("^build:") then
            has_build_target = true
        end
    end

    return has_run_target or has_build_target
end

function check_crate_type(file_path)
    local cwd = vim.fn.getcwd()
    local path = file_path

    -- Check if the file is main.rs, lib.rs, or build.rs
    if file_path:match("/main.rs$") then
        return "bin"
    elseif file_path:match("/lib.rs$") then
        return "lib"
    elseif file_path:match("/build.rs$") then
        return "build"
    end

    -- Search for Cargo.toml
    while path ~= "" and path ~= "." do
        local cargo_toml_path = path .. "/Cargo.toml"
        if vim.fn.filereadable(cargo_toml_path) ~= 0 then
            local cargo_toml = vim.fn.readfile(cargo_toml_path)
            local has_bin = false
            local has_lib = false
            for _, line in ipairs(cargo_toml) do
                if line:match("^%[%[bin%]%]") then
                    has_bin = true
                elseif line:match("^%[%[lib%]%]") then
                    has_lib = true
                end
            end

            -- Determine crate type based on Cargo.toml contents
            if has_bin then
                return "bin"
            elseif has_lib then
                return "lib"
            end
            break -- Cargo.toml found but no specific crate type entries
        end

        if path == cwd then
            break -- Reached the cwd, stop the search
        end

        path = vim.fn.fnamemodify(path, ":h") -- Go up one directory
    end

    return nil -- Crate type could not be determined
end

function is_file_in_test_context()
    local bufnr = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local cursor_line = cursor_pos[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local function is_within_block(start_line, end_line)
        local open_braces = 0
        for i = start_line, end_line do
            if lines[i]:match("{") then open_braces = open_braces + 1 end
            if lines[i]:match("}") then open_braces = open_braces - 1 end

            if i == cursor_line then
                if open_braces > 0 or (open_braces == 0 and lines[i]:match("}")) then
                    return true
                end
            end
        end
        return false
    end

    for i, line in ipairs(lines) do
        if line:match("#%[tokio::test%]") or line:match("#%[test%]") then
            if i == cursor_line or (i + 1 == cursor_line and lines[i + 1]:match("^%s*async?%s+fn%s+test_")) then
                return true
            elseif is_within_block(i + 1, #lines) then
                return true
            end
        end

        if line:match("#%[cfg%(test%)%]") or line:match("^%s*mod%s+tests%s*") then
            if i == cursor_line then
                return true
            elseif is_within_block(i + 1, #lines) then
                return true
            end
        end
    end

    return false
end

function get_bin(file_path)
    local cwd = vim.fn.getcwd()
    local path = file_path

    -- If the file is main.rs, return the package name
    if file_path:match("/main.rs$") then
        return get_package(file_path)
    end

    -- Search for Cargo.toml to find the matching bin name
    while path ~= "" and path ~= "." do
        local cargo_toml_path = path .. "/Cargo.toml"
        if vim.fn.filereadable(cargo_toml_path) ~= 0 then
            local cargo_toml = vim.fn.readfile(cargo_toml_path)
            for _, line in ipairs(cargo_toml) do
                if line:match("^%[%[bin%]%]") then
                    local bin_name, bin_path
                    -- Parse the bin name and path
                    for _, bin_line in ipairs(cargo_toml) do
                        local name_match = bin_line:match('^name%s*=%s*"([^"]+)"')
                        local path_match = bin_line:match('^path%s*=%s*"([^"]+)"')
                        if name_match then bin_name = name_match end
                        if path_match then
                            bin_path = path_match
                            -- Check if the bin path matches the file path
                            if file_path:match(bin_path .. "$") then
                                return bin_name
                            end
                        end
                    end
                end
            end
            break -- Cargo.toml found but no matching bin entry
        end

        if path == cwd then
            break -- Reached the cwd, stop the search
        end

        path = vim.fn.fnamemodify(path, ":h") -- Go up one directory
    end

    return nil -- No matching bin entry found
end

return {
    is_workspace = is_workspace,
    get_package = get_package,
    is_makefile_valid = is_makefile_valid,
    get_makefile = get_makefile,
    check_crate_type = check_crate_type,
    is_file_in_test_context = is_file_in_test_context,
    get_bin = get_bin,
}
