local function config()
    require("auto-save").setup {
        trigger_events = {"InsertLeave", "TextChanged", "VimLeave", "BufLeave"},
    }
end

local function opts()
end

return {
    "Pocco81/auto-save.nvim",
    -- event = "",
    -- dependencies = {},
    config = config,
    -- opts = opts
}
