return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jinja_lsp = {
          templates = "./templates",
          backend = { "./src" },
          lang = "python",
        },
      },
    },
  },
}
