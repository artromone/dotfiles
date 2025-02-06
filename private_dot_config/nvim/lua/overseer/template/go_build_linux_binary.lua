local overseer = require("overseer")

return {
  name = "Go: Build Linux Binary",
  builder = function()
    return {
      cmd = { "env" },
      args = { "GOOS=linux", "GOARCH=amd64", "go", "build", "-o", "./bin/app-linux" },
      components = { "default" },
      name = "Cross Compile Linux Binary",
    }
  end,
  desc = "Build Linux binary on current platform",
}
