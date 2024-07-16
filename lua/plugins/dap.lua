return {
  {
    "rcarriga/nvim-dap-ui",
    event = "BufReadPre",
    dependencies = {
      "mfussenegger/nvim-dap",
      {"theHamsta/nvim-dap-virtual-text", opts = {}},
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({})

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F6>", dap.restart)

      vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

      vim.keymap.set("n", "<leader>?", function ()
        require("dapui").eval(nil, { enter = true })
      end)

      require("dapui").setup()
      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "127.0.0.1",
        port = "3000",
        executable = {
          command = "js-debug-adcapter",
        },
      }

      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type = language,
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "node",
          },
        }
      end

    end
  }
}
