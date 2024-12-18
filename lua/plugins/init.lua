local ui = vim.api.nvim_list_uis()[1]
local width = math.floor(ui.width * 0.5) -- 40% of total width
local height = math.floor(ui.height * 0.45) -- 30% of total height
local row = 0 -- Top position
local col = ui.width - width -- Align to the right

return {
  {
    "ThePrimeagen/vim-be-good",
    lazy = true,
  },
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "float",
          -- style = "minimal",
          relative = "editor",
          width = width,
          height = height,
          row = row,
          col = col,
        },
      },
      lazygit = {
        win = {
          position = "float",
          relative = "editor",
          width = 0.9,
          height = 0.9,
          row = 2.5,
          col = 7,
        },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search/Replace on current file",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Search/Replace current word",
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
