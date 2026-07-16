return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          keymaps = {
            layout = {
              preview = false,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fz",
        function()
          Snacks.picker.zoxide()
        end,
        desc = "Zoxide",
      },
    },
  },
}
