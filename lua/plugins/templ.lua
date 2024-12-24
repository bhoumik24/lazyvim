return {
  -- {
  --     "neovim/nvim-lspconfig",
  --     opts = {
  --       servers = {
  --         -- pyright will be automatically installed with mason and loaded with lspconfig
  --         pyright = {},
  --       },
  --     },
  --   },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "templ",
      })
    end,
  },
}
