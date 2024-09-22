local function config()
    require('trouble').setup()
end

return
{
	"folke/trouble.nvim",
	-- branch = "dev",
 	dependencies = { "nvim-tree/nvim-web-devicons" },
 	config = config,
}
