return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Shows variable values inline while stepping
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			-- debugpy installed by Mason (:MasonInstallAll)
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
			-- .vscode/launch.json files are now read automatically by nvim-dap, no load_launchjs needed.

			local configs = require("dap").configurations.python

			-- Generic Odoo launcher: asks for the config file, uses the project's venv/.venv automatically.
			table.insert(configs, {
				type = "python",
				request = "launch",
				name = "Launch Odoo (choose config)",
				program = "${workspaceFolder}/odoo-bin",
				args = function()
					local conf = vim.fn.input("Odoo config: ", "/etc/odoo19.conf", "file")
					return { "-c", conf, "--dev", "all" }
				end,
				justMyCode = false, -- allow stepping into Odoo core
			})

			-- Odoo 18 launchers
			table.insert(configs, {
				type = "python",
				request = "launch",
				name = "Launch Odoo",
				stopOnEntry = false,
				program = "${workspaceFolder}/odoo-bin",
				pythonPath = "${workspaceFolder}/venv/bin/python3.11",
				args = { "-c", "/etc/odoo18.conf", "--dev", "all" },
			})
			table.insert(configs, {
				type = "python",
				request = "launch",
				name = "Launch Odoo elwardya",
				stopOnEntry = false,
				program = "${workspaceFolder}/odoo-bin",
				pythonPath = "/opt/odoo18/venv/bin/python3.11",
				args = { "-c", "/etc/match_driver.conf", "--dev", "all" },
			})
			table.insert(configs, {
				type = "python",
				request = "launch",
				name = "Launch Odoo test",
				program = "${workspaceFolder}/odoo-bin",
				pythonPath = "${workspaceFolder}/venv/bin/python3.11",
				args = { "-c", "/etc/odoo18_2.conf", "--dev", "all" },
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
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
