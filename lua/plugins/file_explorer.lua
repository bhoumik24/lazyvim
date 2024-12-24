return {
  -- disable neotree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    -- keys = {
    -- { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
    -- { "<cmd>Ex<CR>", "<cmd>Oil<cr>", desc = "Open Oil" },
    -- },
  },
}
