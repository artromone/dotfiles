local function config()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"

    require("edgy").setup({
    left = {
      {
        title = "Navigation",
        ft = "NvimTree",
        size = { height = 0.7 },
      },
      {
        title = "Structure",
        ft = "aerial",
        size = { height = 0.3 },
      },
    },

    -- right = {
    --   {
    --     title = "Scopes",
    --     ft = "dapui_scopes",
    --     size = { height = 0.4 },
    --   },
    --   {
    --     title = "Breakpoints",
    --     ft = "dapui_breakpoints",
    --     size = { height = 0.1 },
    --   },
    --   {
    --     title = "Watches",
    --     ft = "dapui_watches",
    --     size = { height = 0.2 },
    --   },
    --   {
    --     title = "Stack",
    --     ft = "dapui_stacks",
    --     size = { height = 0.3 },
    --   },
    -- },

    -- bottom = {
    --   {
    --     title = "Dap REPL",
    --     ft = "dap-repl",
    --     size = { width = 0.3 },
    --   },
    --   {
    --     title = "Dap console",
    --     ft = "dapui_console",
    --     size = { width = 0.7 },
    --   },
    -- },
  })
end

local function opts()
  return {
    keys = {
    -- ["<_-Left>"] = function(win) win:resize("width", 2) end, -- increase width
    -- ["<_-Right>"] = function(win) win:resize("width", -2) end, -- decrease width
    -- ["<_-Up>"] = function(win) win:resize("height", 2) end, -- increase height
    -- ["<_-Down>"] = function(win) win:resize("height", -2) end, -- decrease height
    -- ["<_-0>"] = function(win) win.view.edgebar:equalize() end, -- reset all custom sizing
    }
  }
end

return {
  "folke/edgy.nvim",
  -- event = "VeryLazy",
  config = config,
  opts = opts,
}