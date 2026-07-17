return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.markdownlint-cli2.jsonc"), "--" },
      },
    },
    linters_by_ft = {
      go = { "staticcheck" },
    },
  },
}
