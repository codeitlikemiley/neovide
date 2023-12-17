local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function get_cargo_commands()
    local cargo_bin_path = vim.fn.expand('~/.cargo/bin')
    local handle = io.popen('ls "'..cargo_bin_path..'"') -- Executes 'ls' command and captures output
    local result = handle:read("*a")
    handle:close()

    local files = {}
    for filename in string.gmatch(result, '([^\n]+)') do
        table.insert(files, filename)
    end

    return files
end

local function cargo_bin()
    local cargo_commands = get_cargo_commands()

    pickers.new({}, {
        prompt_title = 'Cargo/bin Commands',
        finder = finders.new_table({
            results = cargo_commands,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
            actions.select_default:replace(function(bufnr)
                local selection = action_state.get_selected_entry()
                local command = selection and selection.value or action_state.get_current_line()
                actions.close(bufnr)

                if command:match("^cargo%-") then
                    command = command:gsub("^cargo%-", "cargo ")
                end
                vim.cmd('split | terminal ' .. command)
            end)
            return true
        end
    }):find()
end

return cargo_bin
