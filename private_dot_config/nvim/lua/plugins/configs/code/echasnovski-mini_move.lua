local function config() end

local function opts() local move = require('mini.move').setup() end

return {
    'echasnovski/mini.move',
    version = false,
    -- config = config,
    opts = opts
}
