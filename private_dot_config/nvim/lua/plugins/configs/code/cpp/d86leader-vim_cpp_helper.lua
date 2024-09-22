local function config() vim.g.cpp_helper_inclusion_guard_flavour = 1 end

local function opts() end

return {
    'maurges/vim-cpp-helper',
    config = config
    -- opts = opts
}