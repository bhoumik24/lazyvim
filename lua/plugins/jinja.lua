return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jinja_lsp = {
          templates = "./src/**/templates",
          backend = { "./src/**/" },
          lang = "python",
        },
      },
    },
  },
}
