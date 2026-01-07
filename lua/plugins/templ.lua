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
    opts = {
      servers = {
        templ = {},
        html = {
          filetypes = { "html", "templ" },
        },
        tailwindcss = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                templ = "html",
              },
            },
          },
        },
      },
    },
  },
  {
    "catgoose/templ-goto-definition",
    lazy = false,
    ft = { "go", "templ" },
    config = true,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
