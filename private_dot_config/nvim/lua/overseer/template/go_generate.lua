local overseer = require("overseer")

return {
  name = "Go: Generate",
  builder = function()
    return {
      cmd = { "go" },
      args = { "generate", "./..." },
      components = { "default" },
      name = "Go Generate All",
    }
  end,
  desc = "Run go generate for all packages",
}
