local overseer = require("overseer")

return {
  name = "Go: Build macOS Binary",
  builder = function()
    return {
      cmd = { "env" },
      args = {
        "CGO_ENABLED=0",
        "GOOS=darwin",
        "GOARCH=arm64",
        "go",
        "build",
        "-o",
        "./bin/app-macos-arm64",
      },
      components = { "default" },
      name = "Cross Compile macOS Binary",
    }
  end,
  desc = "Build macOS binary on current platform",
}
