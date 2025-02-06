local overseer = require("overseer")

return {
  name = "Go: Tidy Dependencies",
  builder = function()
    return {
      cmd = { "go" },
      args = { "mod", "tidy" },
      components = { "default" },
      name = "Go Module Tidy",
    }
  end,
  desc = "Remove unused dependencies and add missing ones",
}
