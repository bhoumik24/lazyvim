local wk = require("which-key")
wk.add({
  { "<leader>a", group = "avante" },
})

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    version = false, -- set this if you want to always pull the latest change
    opts = function(_, opts)
      -- Default configuration
      opts.hints = { enabled = false }

      opts.auto_suggestions_provider = "gemini"
      opts.provider = "gemini"
      opts.openai = {
        model = "o1-mini",
        api_key_name = "cmd:pass show ai/openai",
        temperature = 0,
        max_tokens = 4096,
      }
      opts.claude = {
        api_key_name = "cmd:pass show ai/anthropic",
      }
      opts.gemini = {
        api_key_name = "cmd:pass show ai/google",
        model = "gemini-2.0-flash",
        temperature = 0,
      }
      opts.vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "cmd:pass show ai/deepseek",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          temperature = 0,
          timeout = 30000,
        },
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "cmd:pass show ai/openrouter",
          model = "deepseek/deepseek-r1-distill-qwen-32b",
        },
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://bhoumik-pc.local.bhoumik.net:11434/v1",
          -- model = "qwen2.5-coder:32b",
          -- model = "deepseek-r1:32b",
          model = "DeepSeekR1-Local:latest",
          disable_tools = true,
        },
      }

      opts.web_search_engine = {
        provider = "google",
        -- api_key_name = "cmd:pass show ai/web-search/tavily",
      }

      -- File selector configuration
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
      opts.file_selector = {
        provider = "snacks",
        provider_opts = {},
      }

      -- Blink.cmp integration
      -- LSP score_offset is typically 60
      opts.providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },
      }

      opts.compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      }
    end,
    -- {
    -- provider = "copilot",
    -- add any opts here
    -- provider = "claude",
    -- vendors = {
    --   deepseek = {
    --     __inherited_from = "openai",
    --     api_key_name = "cmd:pass show ai/deepseek",
    --     endpoint = "https://api.deepseek.com",
    --     model = "deepseek-coder",
    --   },
    -- },
    -- },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- {
      --   "stevearc/dressing.nvim",
      --   opts = {
      --     select = {
      --       enabled = false,
      --       backend = { "snacks" },
      --     },
      --   },
      -- },
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.icons",
      -- {
      --   "zbirenbaum/copilot.lua",
      --   cmd = "Copilot",
      --   event = "InsertEnter",
      --   opts = {
      --     suggestion = { enabled = false },
      --     panel = { enabled = false },
      --   },
      -- },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            -- use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
