return {
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
