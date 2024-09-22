local function config()
    vim.g.memento_history = 28
    vim.g.memento_shorten_path = false
    vim.g.memento_window_width = 100
    vim.g.memento_window_height = 30
end

local function opts() end

return {
    "gaborvecsei/memento.nvim",
    -- event = "",
    dependencies = {'nvim-lua/plenary.nvim'},
    config = config,
    opts = opts
}
