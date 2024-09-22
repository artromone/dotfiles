
local function config()
    
    local vcs_utils = require("../../../utils/vcs")
    
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {left = "", right = ""},
            section_separators = {left = "", right = ""},
            disabled_filetypes = {
                "NvimTree", "aerial", "alpha", "trouble",
                "dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches", "dapui_console", "dap-repl",
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
        },
        sections = {
            lualine_a = { vcs_utils.get_current_file_branch },
            lualine_b = {
                "diff", "filename", {
                    "diagnostics",
                    sources = { "nvim_lsp", },
                    symbols = {error = " ", warn = " ", info = " "}
                }
            },
            lualine_c = {{"aerial", dense = false, colored = true}},
            lualine_x = {
                {
                    function()
                        local msg = "No Active Lsp"
                        local buf_ft = vim.api
                                           .nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~=
                                -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    color = {}
                }, "encoding", "filesize"
            },
            lualine_y = {"progress"},
            lualine_z = {"location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end

return {
    'hoob3rt/lualine.nvim',
    -- event = "",
    -- dependencies = {},
    -- opts = opts,
    config = config
}
