local function config()

	require("neodev").setup({
	  library = { plugins = { "nvim-dap-ui" }, types = true },
	})

    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

	dap.listeners.before.attach.dapui_config = function() dapui.open() end
	dap.listeners.before.launch.dapui_config = function() dapui.open() end
	dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
	dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    require("mason-nvim-dap").setup({
    automatic_installation = true,
ensure_installed = { "codelldb",}
	})

    dap.adapters.executable = {
	type = 'executable',
	command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
	name = 'lldb1',
	host = '127.0.0.1',
	port = 13000
	}

	dap.adapters.codelldb = {
    name = "codelldb server",
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
	}

    dap.configurations.cpp = {
            {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                    local vcs_utils = require("../../utils/vcs")
                    return vim.fn.getcwd() .. '/build/debug'
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = true,
            }
        }

end


return
{ "rcarriga/nvim-dap-ui", 
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap", 
		"nvim-neotest/nvim-nio",
		"folke/neodev.nvim",
	},
	config = config,
	 }
