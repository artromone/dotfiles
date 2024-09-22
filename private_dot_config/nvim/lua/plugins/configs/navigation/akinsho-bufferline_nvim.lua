local function config()
    vim.opt.termguicolors = true

    local bufferline = require("bufferline")
    bufferline.setup {
        options = {
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,
            -- separator_style = "slope",

            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,

            groups = {
                options = {
      toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
                items = {
                    {
                        name = "Lua", -- Mandatory
                        -- highlight = {underline = true, sp = "white"}, -- Optional
                        priority = 2, -- determines where it will appear relative to other groups (Optional)
                        auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
                        matcher = function()
                            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) -- Получаем имя файла текущего буфера по его ID
                            return bufname:match("%.lua")
                        end
                    },
                    {
                        name = "Text",
                        -- highlight = {undercurl = true, sp = "yellow"},
                        auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
                        matcher = function()
                            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) -- Получаем имя файла текущего буфера по его ID
                            return bufname:match("%.md") or bufname:match("%.txt")
                        end
                   }
                }
            },

            offsets = {
                {
                    filetype = "NvimTree",
                    text = "artromone",
                    text_align = "center",
                    separator = false,
                }
            },

            show_close_icon = false,
            always_show_bufferline = false
        }
    }
end

local function opts()
end

return {
    "akinsho/bufferline.nvim",
    -- version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = config
    -- opts = opts
}
