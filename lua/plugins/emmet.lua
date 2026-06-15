return {
  -- Configure Emmet Language Server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
            "templ",
          },
          init_options = {
            includeLanguages = {
              templ = "html", -- Treat templ files as html for emmet expansion
            },
          },
        },
      },
    },
  },

  -- Configure nvim-ts-autotag to support auto-closing and renaming HTML tags in templ files
  {
    "windwp/nvim-ts-autotag",
    opts = {
      aliases = {
        ["templ"] = "html",
      },
    },
  },

  -- Extend blink.cmp to load HTML snippets when editing templ files
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = {
            opts = {
              extended_filetypes = {
                templ = { "html" },
              },
            },
          },
        },
      },
    },
  },
}
