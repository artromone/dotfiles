local function config()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
end

local function opts()
    return {
        -- Warn if any required option above is missing. May emit false positives
        -- if some other plugin modifies them, which in that case you can just
        -- ignore. Feel free to remove this line after you've gotten Modicator to
        -- work properly.
        show_warnings = false,
        highlights = {
            defaults = {
                bold = true
                -- italic = false,
            }
        },
        integration = {
            lualine = {
                enabled = true,
                -- Letter of lualine section to use (if `nil`, gets detected automatically)
                mode_section = 'z',
                -- Whether to use lualine's mode highlight's foreground or background
                highlight = 'bg'
            }
        }
    }
end

return {
    "mawkler/modicator.nvim",
    dependencies = "mawkler/onedark.nvim",
    config = config,
    opts = opts
}
