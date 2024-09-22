local function config()
    require("mason").setup()
    require("mason-lspconfig").setup {
         ensure_installed = { "gopls",  "jdtls", --[[ "pylsp", ]]--[[  "neocmake",  ]]},
     }
end

local function opts()
end

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        "neovim/nvim-lspconfig",
    },
    config = config,
    -- opts = opts
}
