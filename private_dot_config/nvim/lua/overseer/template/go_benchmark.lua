local overseer = require("overseer")

return {
  name = "Go: Benchmark",
  builder = function()
    return {
      cmd = { "go" },
      args = { "test", "-bench=.", "-benchmem" },
      components = { "default" },
      name = "Run Go Benchmarks",
    }
  end,
  desc = "Run benchmarks for the project",
  tags = { overseer.TAG.TEST },
}
