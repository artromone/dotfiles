local function setup_runtimepath()
    vim.opt.runtimepath:append("~/.cache/nvim/utils/parsers")
end

local function setup_treesitter_parsers()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query", "cpp", "java", "go"
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        parser_install_dir = "~/.cache/nvim/utils/parsers"
    }
end

local function setup_treesitter_highlight()
    require("nvim-treesitter.configs").setup {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 10 * 1024 * 1024 -- 10 MB
                local ok, stats = pcall(vim.loop.fs_stat,
                                        vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false
        },
    }
end

local function setup_treesitter_rainbow()
    require("nvim-treesitter.configs").setup {
        rainbow = {enable = true, extended_mode = true, max_file_lines = 1000}
    }
end

local function config()
    setup_runtimepath()
    setup_treesitter_parsers()
    setup_treesitter_highlight()
    setup_treesitter_rainbow()

    -- vim.treesitter.language.register("c", "vimcmake")
end

local function opts() end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = config
    -- opts = opts
}
