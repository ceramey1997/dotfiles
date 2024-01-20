return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+debug" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "theHamsta/nvim-dap-virtual-text" },
    ft = {},
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "[D]ap [B]reakpoint Toggle"
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "[D]ap [C]ontinue"
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "[D]ap Step [I]nto"
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "[D]ap Step [O]ut"
      },
      {
        "N",
        function()
          require("dap").step_over()
        end,
        desc = "[D]ap Step [O]ver"
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
          require("dapui").close()
          -- HACK: to refresh neo-tree width
          vim.cmd "Neotree toggle"
          vim.cmd "Neotree toggle"
        end,
        desc = "[D]ap [T]erminate"
      },
    },
    config = function(plugin, opts)
      local dap = require("dap")
      -- setup dap config by VsCode launch.json file
      -- require("dap.ext.vscode").load_launchjs()

      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "[D]ap [U]I Toggle" },
    },
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "theHamsta/nvim-dap-virtual-text" }
    },
    ft = {},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      commented = true
    }
  }
}
