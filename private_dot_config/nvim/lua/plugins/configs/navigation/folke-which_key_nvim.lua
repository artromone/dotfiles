local function config()
    vim.o.timeout = true
    vim.o.timeoutlen = 2000

    require("which-key").setup()
end

local function opts() end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = config
    -- opts = opts
}
