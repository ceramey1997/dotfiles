local icons = require("cocodust.config.icons")

return {
  { "nvim-lua/plenary.nvim" },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>b", "<cmd>Neotree toggle<cr>", desc = "Open File Tree" },
    },
    opts = function()
      return {
        filters = {
          dotfiles = false,
          custom = {},  -- always hide these files
          exclude = {}, -- always show these files
        },
        close_if_last_window = true,
        filesystem = {
          bind_to_cwd = {
            enabled = false
          },
          follow_current_file = {
            enabled = true,
          },
        },
        default_component_configs = {
          modified = {
            symbol = icons.Other.Paper_AirPlane.Icon,
            highlight = "NeoTreeModified",
          },
          diagnostics = {
            symbols = {
              hint = icons.Diagnostics.Hint.Icon,
              info = icons.Diagnostics.Info.Icon.Outline,
              warn = icons.Diagnostics.Warning.Icon.Outline,
              error = icons.Diagnostics.Error.Icon.File_Error,
            },
            highlights = {
              hint = "DiagnosticSignHint",
              info = "DiagnosticSignInfo",
              warn = "DiagnosticSignWarn",
              error = "DiagnosticSignError",
            }
          },
          git_status = {
            symbols = {
              added = icons.Git.Added.Icon.File_Plus,
              modified = icons.Git.Modified.Icon.Git_PR,
              deleted = icons.Git.Deleted.Icon.X,
              renamed = icons.Git.Renamed.Icon,
              -- Status Type
              untracked = icons.Git.Untracked.Icon,
              ignored = icons.Git.Ignored.Icon,
              unstaged = "",
              staged = icons.Git.Staged.Icon,
              conflict = icons.Git.Conflict.Icon,
            },
          },
        }
      }
    end,
    init = function()
      -- Open on initial startup
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          vim.cmd.cd(vim.fn.argv(0))
          require("neo-tree")
        end
      end
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.fn.sign_define("DiagnosticSignError",
        {
          text = icons.Diagnostics.Error.Icon.Line_Error,
          texthl = "DiagnosticSignError"
        }
      )
      vim.fn.sign_define("DiagnosticSignWarning",
        {
          text = icons.Diagnostics.Warning.Icon.Solid,
          texthl = "DiagnosticSignWarning"
        }
      )
      vim.fn.sign_define("DiagnosticSignInformation",
        {
          text = icons.Diagnostics.Info.Icon.Solid,
          texthl = "DiagnosticSignInformation"
        }
      )
      vim.fn.sign_define("DiagnosticSignHint",
        {
          text = icons.Diagnostics.Hint.Icon,
          texthl = "DiagnosticSignHint"
        }
      )
    end,
  },
}
