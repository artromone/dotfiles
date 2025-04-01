local overseer = require("overseer")

return {
  name = "Go: Get Dependencies",
  builder = function()
    return {
      cmd = { "go" },
      args = { "mod", "download" },
      components = { "default" },
      name = "Go Module Download",
    }
  end,
  desc = "Download project dependencies",
}
