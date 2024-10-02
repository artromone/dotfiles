local function config()
require('nvim-highlight-colors').setup({})
end

local function opts()
end

return {
    "brenoprata10/nvim-highlight-colors",
    -- event = "",
    -- dependencies = {},
    config = config,
    opts = opts
}
