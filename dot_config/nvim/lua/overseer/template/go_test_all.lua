local overseer = require("overseer")

return {
  name = "Go: Test All",
  builder = function()
    return {
      cmd = { "go" },
      args = { "test", "./..." },
      components = { "default", { "on_output_quickfix", open = true } },
      name = "Go Test All Packages",
    }
  end,
  desc = "Run tests for all packages",
  tags = { overseer.TAG.TEST },
}
