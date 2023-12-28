local dap = require('dap')

function load_all_dap_configurations()
    local cwd = vim.fn.getcwd()
    local dap_config_dir = cwd .. '/.dap_config/'

    -- Read all files in the .dap_config directory
    local files = vim.fn.readdir(dap_config_dir)

    for _, file in ipairs(files) do
        local language = file:match("^(.+)%.lua$")
        if language then
            local config_file_path = dap_config_dir .. file
            if vim.fn.filereadable(config_file_path) ~= 0 then
                local config = dofile(config_file_path)
                dap.configurations[language] = config()
            else
                print("DAP configuration file not found or not readable: " .. config_file_path)
            end
        end
    end
end

return load_all_dap_configurations
