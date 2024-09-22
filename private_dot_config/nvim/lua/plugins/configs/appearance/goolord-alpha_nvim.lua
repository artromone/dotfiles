function greet()
    local currentTime = os.date("%H:%M")
    
    local hours, minutes = currentTime:match("(%d+):(%d+)")
    
    if tonumber(hours) >= 6 and tonumber(hours) < 12 then
        return "Good morning"
    elseif tonumber(hours) >= 0 and tonumber(hours) < 6 then
        return "Good night"
    elseif tonumber(hours) >= 12 and tonumber(hours) < 17 then
        return "Good afternoon"
    else
        return "Good evening"
    end
end

local function config()
    if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function() require("lazy").show() end
        })
    end
    local dashboard = require("alpha.themes.dashboard")
    require("alpha").setup(dashboard.opts)
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
            local v = vim.version()
            -- local dev = ""
            -- if v.prerelease == "dev" then
            --     dev = "-dev+" .. v.build
            -- else
            --     dev = ""
            -- end
            local version = v.major .. "." .. v.minor .. "." .. v.patch--[[  .. dev ]]
            local stats = require("lazy").stats()
            local plugins_count = stats.loaded .. "/" .. stats.count
            local ms = math.floor(stats.startuptime + 0.5)
            local time = vim.fn.strftime("%H:%M:%S")
            local date = vim.fn.strftime("%d.%m.%Y")
            local line1 = plugins_count .. " plugins loaded in " .. ms .. "ms"
            local line2 = version
            local line3 = ""

            local line1_width = vim.fn.strdisplaywidth(line1)
            local line2Padded = string.rep(" ", (line1_width -
                                               vim.fn.strdisplaywidth(line2)) /
                                               2) .. line2
            local line3Padded = string.rep(" ", (line1_width -
                                               vim.fn.strdisplaywidth(line3)) /
                                               2) .. line3

            dashboard.section.footer.val = {line1, line2Padded, line3Padded}
            pcall(vim.cmd.AlphaRedraw)
        end
    })
end

local function opts()
    local dashboard = require("alpha.themes.dashboard")
    require("alpha.term")
    
    local logo = {
        [[                                                                          ]],
        [[                                                                          ]],
        -- [[                                                                          ]],
        -- [[                                                                          ]],
        [[                                                                          ]],
        [[                                                                          ]],
        [[                                                                          ]],
        [[                 __                                                       ]],
        [[                /\ \__                                                    ]],
        [[     __     _ __\ \ ,_\  _ __   ___     ___ ___     ___     ___      __   ]],
        [[   /'__`\  /\`'__\ \ \/ /\`'__\/ __`\ /' __` __`\  / __`\ /' _ `\  /'__`\ ]],
        [[  /\ \L\.\_\ \ \/ \ \ \_\ \ \//\ \L\ \/\ \/\ \/\ \/\ \L\ \/\ \/\ \/\  __/ ]],
        [[  \ \__/.\_\\ \_\  \ \__\\ \_\\ \____/\ \_\ \_\ \_\ \____/\ \_\ \_\ \____\]],
        [[   \/__/\/_/ \/_/   \/__/ \/_/ \/___/  \/_/\/_/\/_/\/___/  \/_/\/_/\/____/]],
        [[                                                                          ]],
        [[                                                                          ]]
    } -- https://patorjk.com/software/taag/#p=display&v=0&f=Larry%203D&t=artromone

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {
        dashboard.button("f", "Find files", ":Telescope find_files <CR>"),
        dashboard.button("l", "Lazy", ":Lazy <CR>"),
        dashboard.button("m", "Mason", ":Mason <CR>"),
        -- dashboard.button("s", "Last session", '<cmd>lua require("persistence").load({ last = true })<cr>'),

        dashboard.button("q", "Quit", ":q <CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard.section.header.opts.hl = "Function"
    dashboard.section.buttons.opts.hl = "Identifier"
    dashboard.section.footer.opts.hl = "Function"
    dashboard.opts.layout[1].val = 4

    return dashboard
end

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = config,
    opts = opts
}
