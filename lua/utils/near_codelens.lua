function cursor_near_codelens()
    local current_pos = vim.api.nvim_win_get_cursor(0)
    local current_line = current_pos[1]

    local lenses = vim.lsp.codelens.get()

    for _, lens in pairs(lenses) do
        local lens_line = lens.range.start.line + 1 -- Lua is 1-indexed
        if current_line == lens_line then           -- Check if cursor is on the exact lens line
            return true
        end
    end

    return false
end

return cursor_near_codelens
