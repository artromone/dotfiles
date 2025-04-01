local overseer = require("overseer")

return {
  name = "Go: Golangci-lint",
  builder = function()
    return {
      cmd = { "golangci-lint" },
      args = { "run", "./..." },
      components = { "default", { "on_output_quickfix", open = true } },
      name = "Golangci-lint Code Analysis",
    }
  end,
  desc = "Run golangci-lint for comprehensive linting",
  condition = {
    callback = function()
      return vim.fn.executable("golangci-lint") == 1
    end,
  },
}
