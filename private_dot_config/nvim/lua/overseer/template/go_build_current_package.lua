local overseer = require("overseer")

return {
  name = "Go: Build Current Package",
  builder = function()
    return {
      cmd = { "go" },
      args = { "build", "." },
      components = { "default" },
      name = "Go Build Current Package",
    }
  end,
  desc = "Build the current Go package",
}
