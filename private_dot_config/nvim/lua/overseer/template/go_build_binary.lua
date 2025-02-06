local overseer = require("overseer")

return {
  name = "Go: Build Binary",
  builder = function(params)
    return {
      cmd = { "go" },
      args = { "build", "-o", params.output or "./bin/app", "." },
      components = { "default" },
      name = "Go Build Binary",
      metadata = { output = params.output },
    }
  end,
  desc = "Build a Go binary with optional output path",
  params = {
    output = { optional = true, type = "string", desc = "Output binary path" },
  },
  tags = { overseer.TAG.BUILD },
}
