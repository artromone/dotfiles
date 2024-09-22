local function config() end

local function opts()
    return {
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
        end,

        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

        layout = {
            min_width = 25,
        default_direction = "prefer_right",
        placement = "edge",
        },

        attach_mode = "global",

        disable_max_lines = 10000,
        disable_max_size = 2000000,

        filter_kind = {
            "Class", "Constructor", "Enum", "Function", "Interface", "Module",
            "Method", "Struct"
        },
        icons = {},
        
        -- open_automatic = true,
        close_automatic_events = {'unsupported'}
    }
end

return {
    "stevearc/aerial.nvim",
    -- event = "",
    -- config = config,
    opts = opts,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"
    }
}
