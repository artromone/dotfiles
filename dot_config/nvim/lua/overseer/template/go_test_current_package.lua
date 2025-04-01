local overseer = require("overseer")

return {
  name = "Go: Test Current Package",
  builder = function()
    return {
      cmd = { "go" },
      args = { "test", "." },
      components = { "default", { "on_output_quickfix", open = true } },
      name = "Go Test Current Package",
    }
  end,
  desc = "Run tests for current package",
}
