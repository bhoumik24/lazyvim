return {
  {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = false,
      })
    end,
  },
  {
    "nvim-cmp",
    dependencies = {
      -- supermaven
      {
        "supermaven-inc/supermaven-nvim",
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
      -- table.insert(opts.formatting, 1, {
      --   format = require("lspkind").cmp_format({
      --     mode = "symbol_text",
      --     maxwidth = 50,
      --     symbol_map = { Supermaven = "" },
      --   }),
      -- })
    end,
  },
}
