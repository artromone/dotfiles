local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins_file = vim.fn.stdpath("config") .. "/lua/plugins/plugins.lua"
local plugins = dofile(plugins_file)
local plugin_specs = {}

for _, plugin_path in ipairs(plugins.enabled) do
    local config_path = vim.fn.stdpath("config") .. "/lua/plugins/configs/" .. plugin_path
    local config = dofile(config_path)
    table.insert(plugin_specs, config)
end

print(plugin_specs)

require("lazy").setup(plugin_specs)
