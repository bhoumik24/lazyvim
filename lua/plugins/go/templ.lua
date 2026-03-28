vim.filetype.add({ extension = { templ = "templ" } })

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    opts = { ensure_installed = { "templ" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.templ = opts.servers.templ or {}
      opts.servers.html = vim.tbl_deep_extend("force", opts.servers.html or {}, {
        filetypes = { "html", "templ" },
      })
      opts.servers.tailwindcss = vim.tbl_deep_extend("force", opts.servers.tailwindcss or {}, {
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              templ = "html",
            },
          },
        },
      })

      local star = opts.servers["*"] or {}
      star.keys = star.keys or {}

      local filtered = {}
      for _, key in ipairs(star.keys) do
        if key[1] ~= "gd" then
          table.insert(filtered, key)
        end
      end

      table.insert(filtered, {
        "gd",
        function()
          return vim.lsp.buf.definition()
        end,
        desc = "Goto Definition",
        has = "definition",
      })

      star.keys = filtered

      opts.servers["*"] = star
    end,
  },
  {
    "catgoose/templ-goto-definition",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("templ-goto-definition").setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        templ = { "templ" },
      },
    },
  },
}
