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
        win = function()
          if #vim.api.nvim_list_uis() == 0 then
            return {
              position = "float",
              style = "minimal",
            }
          else
            local ui = vim.api.nvim_list_uis()[1]
            local width = math.floor(ui.width * 0.5) -- 40% of total width
            local height = math.floor(ui.height * 0.6) -- 30% of total height
            local row = 0 -- Top position
            local col = ui.width - width -- Align to the right
            return {
              position = "float",
              style = "minimal",
              relative = "editor",
              width = width,
              height = height,
              row = row,
              col = col,
              resize = true,
            }
          end
        end,
      },
      lazygit = {
        win = {
          position = "float",
          relative = "editor",
          width = 0.9,
          height = 0.9,
          row = (ui.height * 0.05),
          col = (ui.width * 0.05),
        },
      },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      {
        "<leader>nf",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Neogen",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "williamboman/mason.nvim",
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
