local function config()
end

local function opts()
end

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  -- opts = {
  --   -- add any custom options here
  -- }
}
