return {
  {
    "ThePrimeagen/vim-be-good",
    lazy = true,
  },
  {
    "folke/snacks.nvim",
    opts = {
      animate = {
        fps = 120,
      },
      explorer = {
        replace_netrw = true,
      },
      terminal = {
        win = {
          position = "float",
          style = "minimal",
          relative = "editor",
          width = 0.5,
          height = 0.6,
          row = 0,
          col = 0.5,
          resize = true,
        },
      },
      lazygit = {
        win = {
          position = "float",
          relative = "editor",
          width = 0.9,
          height = 0.9,
          row = 0.05,
          col = 0.05,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- diagnostics = {
      --   virtual_text = false,
      --   virtual_lines = true,
      -- },
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "mason-org/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "codelldb" } },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
