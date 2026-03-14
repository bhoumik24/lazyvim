return {
  {
    "nvim-treesitter/nvim-treesitter",
    ft = "nu",
    dependencies = "nushell/tree-sitter-nu",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nushell = {
          -- Default settings for the Nushell LSP
          settings = {
            nushell = {
              -- Customize settings as needed
              maxParseErrors = 10,
              commandCompletionMode = "full",
            },
          },
          -- Optionally specify file patterns
          filetypes = { "nu" },
        },
      },
    },
  },
  {
    -- Ensure the Nu filetype is detected
    "neovim/nvim-lspconfig",
    ft = "nu",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "nu-lsp")
      end
    end,
  },
}
