local overseer = require("overseer")

return {
  name = "Go: Run Main",
  builder = function(params)
    return {
      cmd = { "go" },
      args = { "run", params.file or "main.go" },
      components = { "default" },
      name = "Go Run Main",
      metadata = { file = params.file },
    }
  end,
  desc = "Run a specific Go file",
  params = {
    file = { optional = true, type = "string", desc = "Main file to run" },
  },
}
