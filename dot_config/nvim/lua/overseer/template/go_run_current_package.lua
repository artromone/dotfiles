local overseer = require("overseer")

return {
  name = "Go: Run Current Package",
  builder = function()
    return {
      cmd = { "go" },
      args = { "run", "." },
      components = { "default" },
      name = "Go Run Current Package",
    }
  end,
  desc = "Run the current Go package",
}
