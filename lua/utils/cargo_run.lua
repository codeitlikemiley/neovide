local get_makefile = require("utils.package").get_makefile
local is_file_in_test_context = require("utils.package").is_file_in_test_context
local check_crate_type = require("utils.package").check_crate_type
local get_package = require("utils.package").get_package
local get_bin = require("utils.package").get_bin

function cargo_run()
    local file_path = vim.fn.expand('%:p')
    local makefile_path = get_makefile(file_path)
    local makefile_valid = is_makefile_valid(makefile_path)
    local is_test_context = is_file_in_test_context()
    local crate_type = check_crate_type(file_path)
    local package_name = get_package(file_path) or vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    local bin_name = get_bin(file_path)

    -- Determine command based on context
    local cmd
    if is_test_context then
        vim.cmd("lua require('neotest').run.run()")
        return
    elseif makefile_valid then
        if crate_type == "bin" then
            cmd = "make run"
        elseif crate_type == "build" then
            cmd = "make build"
        else
            print("Cannot run makefile for current opened file.")
            return
        end
    else
        if crate_type == "bin" then
            cmd = "RUSTFLAGS='-A warnings' cargo run -p " .. package_name .. (bin_name and (" --bin " .. bin_name) or "")
        elseif crate_type == "build" then
            cmd = "RUSTFLAGS='-A warnings' cargo build -p " .. package_name
        else
            print("Cannot run cargo commands for current opened file.")
            return
        end
    end

    vim.cmd(":new")
    vim.cmd(":term " .. cmd)
end

return cargo_run
