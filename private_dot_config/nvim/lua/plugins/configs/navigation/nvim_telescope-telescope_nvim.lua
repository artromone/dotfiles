local function config()
    -- Подключаем Telescope
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    -- Настройка команды для отображения открытых буферов
    telescope.setup {
        defaults = {
            mappings = {
                i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist},
                n = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}
            },
            file_ignore_patterns = {".hg", ".git", "build", "doc"},
            preview = {
                treesitter = false,
            },
        },
        extensions = {
            repo = {
                list = {
                    fd_opts = {"--no-ignore-vcs"},
                    search_dirs = {"~/programming"}
                }
            },
            undo = {
            },
        }
    }

    -- require('telescope.builtin').buffers {
    --     show_all_buffers = true,
    --     sort_lastused = true,
    --     sort_mru = true,
    --     ignore_current_buffer = true
    -- }

    require("telescope").load_extension("repo")
    require("telescope").load_extension("undo")
end

local function opts() end

return {
    'cljoly/telescope-repo.nvim', {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.7',
        dependencies = {'nvim-lua/plenary.nvim',"debugloop/telescope-undo.nvim",},
        config = config
        -- opts = opts
    }
}
