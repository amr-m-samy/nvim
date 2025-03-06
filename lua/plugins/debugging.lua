return {
	{
		"mfussenegger/nvim-dap",
		config = function() end,
	},
	{

		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("dap.ext.vscode").load_launchjs(nil, {})
			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "launch",
				name = "Launch Odoo",
				stopOnEntry = "false",
				program = "${workspaceFolder}/odoo-bin",
				pythonPath = "${workspaceFolder}/venv/bin/python3.11",
				args = { "-c", "/etc/odoo18.conf", "--dev", "all" },
			})

			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "launch",
				name = "Launch Odoo test",
				program = "${workspaceFolder}/odoo-bin",
				pythonPath = "${workspaceFolder}/venv/bin/python3.11",
				args = { "-c", "/etc/odoo18_2.conf", "--dev", "all" },
			})
			-- table.insert(require("dap").configurations.python, {
			-- 	type = "python",
			-- 	request = "launch",
			-- 	name = "Flask",
			-- 	-- program = "${file}",
			-- 	module = "flask",
			-- 	justMyCode = false,
			-- 	args = { "--app", "flaskr", "run", "-h", "0.0.0.0", "-p", "8001" },
			-- 	-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
			-- })
		end,
	},
	{

		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
