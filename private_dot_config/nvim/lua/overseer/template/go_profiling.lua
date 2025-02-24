local overseer = require("overseer")

return {
  name = "Go: Profiling",
  builder = function()
    return {
      cmd = "/usr/bin/bash",
      args = { vim.fn.stdpath("config") .. "/scripts/go_profiling.sh" },
      components = { "default" },
      name = "Go Profiling",
    }
  end,
  desc = "Run tests and generate coverage report",
}
