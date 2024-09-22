local function config()
local qmlformat = require('qmlformat')
-- you can define this however you want
vim.keymap.set('n', '<leader>i', require('qmlformat').preview_qmlformat_changes, {})
end

local function opts()
end

return {
    "Leon-Degel-Koehn/qmlformat.nvim",
    -- event = "",
    -- dependencies = {},
    config = config,
    opts = opts
}
