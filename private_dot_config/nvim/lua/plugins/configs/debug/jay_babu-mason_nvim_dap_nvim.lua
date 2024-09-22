local function config()
end

local function opts()
    return {
        handlers = {},
--        ensure_installed = { "lua_ls", "gopls", "jdtls", "pylsp", "neocmake", },
    }
end

return {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    },
    -- opts = opts
}
