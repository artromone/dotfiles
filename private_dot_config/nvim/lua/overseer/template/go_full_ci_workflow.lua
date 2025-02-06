local overseer = require("overseer")

return {
  name = "Go: Full CI Workflow",
  builder = function()
    return {
      strategy = {
        "orchestrator",
        tasks = {
          { "Go: Tidy Dependencies" },
          { "Go: Golangci-lint" },
          { "Go: Test with Coverage" },
          { "Go: Build Binary" },
        },
      },
      components = { "default" },
      name = "Complete CI Pipeline",
    }
  end,
  desc = "Run complete CI workflow: deps, lint, test, build",
}
