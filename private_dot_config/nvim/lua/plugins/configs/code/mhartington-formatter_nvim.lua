local function config() end

local function opts()
    return {
        filetype = {
            cpp = {
                function()
                    return {
                        exe = "clang-format",
                        args = {"-style=file"},
                        stdin = true,
                        cwd = vim.fn.expand("~/programming/")
                    }
                end
            },
            -- java = {
            --     function()
            --         return {
            --             exe = "java",
            --             args = {
            --                 "-jar",
            --                 "~/.config/nvim/utils/format/google-java-format.jar",
            --                 vim.api.nvim_buf_get_name(0)
            --             },
            --             stdin = true,
            --             cwd = vim.fn.expand("~")
            --         }
            --     end
            -- },
            python = {
                function()
                    return {exe = "black", args = {"-"}, stdin = true}
                end
            },
            go = {function() return {exe = "gofmt", stdin = true} end},
       }
    }
end

return {
    "mhartington/formatter.nvim",
    -- event = "",
    -- dependencies = {},
    -- config = config,
    opts = opts
}
