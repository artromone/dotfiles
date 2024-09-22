local M = {}

-- local function setup_ccls()
--     local vcs_utils = require("../../../utils/vcs")
--
--     local lspconfig = require("lspconfig")
--     lspconfig.ccls.setup {
--         on_attach = function(client, bufnr) end,
--         filetypes = {"c", "cpp", "h"},
--         root_dir = lspconfig.util.root_pattern(".git", ".hg"),
--         cmd = {"ccls"},
--         on_init = function(client)
--             local root_dir = lspconfig.util.root_pattern(".git", ".hg")(vim.fn.expand('%:p')) or vim.loop.cwd()
--             -- local vcs_utils = require("../../../utils/vcs")
--
--             client.config.flags.allow_incremental_sync = true
--             client.workspaceFolders = { {uri = vim.uri_from_fname(root_dir), name = "ccls"} }
--             client.config.init_options.compilationDatabaseDirectory = root_dir
--             -- client.config.init_options.cache.directory = '/home/art/.cache/ccls-cache/' .. vcs_utils.get_current_file_branch()
--         end,
--         init_options = {cache = {directory = '/home/art/.cache/ccls-cache/'}}
--     }
-- end

local function setup_clangd()
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"c", "cpp", "h"},
        root_dir = lspconfig.util.root_pattern(".git", ".hg"),
        cmd = {"clangd"},
        on_init = function(client)
            local root_dir = lspconfig.util.root_pattern(".git", ".hg")(vim.fn.expand('%:p')) or vim.loop.cwd()
            -- client.config.flags.allow_incremental_sync = true
            client.workspaceFolders = {
                {uri = vim.uri_from_fname(root_dir), name = "clangd"}
            } client.config.init_options.compilationDatabaseDirectory = root_dir .. "/build"
        
        end,
    }
end

-- local function setup_neocmake()
--     local lspconfig = require("lspconfig")
--     lspconfig.neocmake.setup {
--         on_attach = function(client, bufnr) end,
--         filetypes = {"cmake"},
--         root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git", ".hg"),
--         cmd = {"neocmakelsp", "--stdio"},
--         single_file_support = true,
--         init_options = {format = {enable = true}, scan_cmake_in_package = true}
--     }
-- end

-- local function setup_pylsp()
--     local lspconfig = require("lspconfig")
--     lspconfig.pylsp.setup {
--         on_attach = function(client, bufnr) end,
--         filetypes = {"python"},
--         root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py",
--                                                ".git", ".hg"),
--         settings = {
--             pylsp = {
--                 plugins = {
--                     pylint = {
--                         enabled = false,
--                         args = {"--enable=F,E"},
--                         threshold = "warning"
--                     },
--                     jedi_completion = {fuzzy = true},
--                     pycodestyle = {enabled = true, maxLineLength = 120}
--                 }
--             }
--         }
--     }
-- end

local function setup_gopls()
    local lspconfig = require("lspconfig")
    lspconfig.gopls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"go"},
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        cmd = {"gopls", "-remote=auto"}
    }
end

local function setup_jdtls()
    local lspconfig = require("lspconfig")
    lspconfig.jdtls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"java"},
        root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
        cmd = {"jdtls"},
    }
end

local function config()
    setup_clangd()
    --setup_ccls()
    -- setup_neocmake()
    -- setup_pylsp()
    setup_gopls()
    setup_jdtls()
end

local function opts()
end

return {
    "neovim/nvim-lspconfig", 
 config = config,
-- opts = opts
}
