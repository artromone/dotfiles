local overseer = require("overseer")

return {
  name = "Go: Build",
  builder = function()
    return {
      cmd = { "go" },
      args = { "build", "./..." },
      components = { "default" },
      name = "Go Build All Packages",
    }
  end,
  desc = "Build all Go packages in the project",
  tags = { overseer.TAG.BUILD },
}
