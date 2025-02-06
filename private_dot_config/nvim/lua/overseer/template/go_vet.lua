local overseer = require("overseer")

return {
  name = "Go: Vet",
  builder = function()
    return {
      cmd = { "go" },
      args = { "vet", "./..." },
      components = { "default", { "on_output_quickfix", open = true } },
      name = "Go Vet Static Analysis",
    }
  end,
  desc = "Run go vet for static code analysis",
}
