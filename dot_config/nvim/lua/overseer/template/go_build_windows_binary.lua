local overseer = require("overseer")

return {
  name = "Go: Build Windows Binary",
  builder = function()
    return {
      cmd = { "env" },
      args = { "GOOS=windows", "GOARCH=amd64", "go", "build", "-o", "./bin/app.exe" },
      components = { "default" },
      name = "Cross Compile Windows Binary",
    }
  end,
  desc = "Build Windows binary on current platform",
}
