local overseer = require("overseer")

return {
  name = "Go: Test with Coverage",
  builder = function()
    return {
      cmd = { "go" },
      args = { "test", "./...", "-coverprofile=coverage.out" },
      components = { "default" },
      name = "Go Test with Coverage Report",
    }
  end,
  desc = "Run tests and generate coverage report",
}
