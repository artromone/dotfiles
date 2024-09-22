local function config()

    vim.opt.foldmethod = 'manual' -- По умолчанию выключить сворачивание

    local function setup_ufo()
        require("ufo").setup({
            provider_selector = function()
                return {"treesitter", "indent"}
            end
        })
    end

    -- Настройки для fold-preview.nvim
    local function setup_fold_preview()
        require("fold-preview").setup({
            -- Настройки для fold-preview.nvim
        })
    end

    setup_ufo()
    setup_fold_preview()
end

local function opts()
    return {provider_selector = function() return {"treesitter", "indent"} end}
end

return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async", {
    'luukvbaal/statuscol.nvim',
    opts = function()
        local builtin = require('statuscol.builtin')

        vim.cmd [[ highlight FoldColumn guibg=#242b38 guifg=#546178 ]]

        return {
            --setopt = true,
            --relculright = true,
            segments = {
                {text = {builtin.lnumfunc, ' '}, condition = {true, builtin.not_empty}, },
                {text = {builtin.foldfunc}, hl = "FoldColumn"},
                {text = {'%s'}},
            },
        }
    end
}

        },
        event = "BufReadPost",
        config = config,
        opts = opts
    }, {
        "anuvyklack/fold-preview.nvim",
        dependencies = "anuvyklack/keymap-amend.nvim",
        config = true
    }, "kevinhwang91/promise-async"
}