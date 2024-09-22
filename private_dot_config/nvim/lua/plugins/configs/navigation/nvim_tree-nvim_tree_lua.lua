local function setup_nvim_tree()
    require'nvim-tree'.setup {
        sort = {sorter = "case_sensitive"},
        view = {width = 30},
        renderer = {group_empty = true},
        disable_netrw = false,
        hijack_netrw = true
    }
end

local function setup_netrw()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
end

local function setup_autocmds()
    function change_root_to_cwd()
        local cwd = vim.fn.getcwd()
        require("nvim-tree.api").tree.change_root(cwd)
    end
    vim.cmd [[ autocmd DirChanged * call v:lua.change_root_to_cwd() ]]

    function find_file_on_bufenter()
        require("nvim-tree.api").tree.find_file()
    end
    vim.cmd [[ autocmd BufEnter * call v:lua.find_file_on_bufenter() ]]
end

local function config()
    setup_nvim_tree()
    setup_netrw()
    setup_autocmds()
end

local function opts() end

-- vim.cmd [[
--      highlight NvimTreeWinSeparator guifg=#FF0000
--     ]]

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = config
    -- opts = opts
}
