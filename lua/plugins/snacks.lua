return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        terminal = {
          wo = {
            winhighlight = "Normal:SnacksTerminalNormal,NormalNC:SnacksTerminalNormal,FloatBorder:SnacksTerminalBorder",
          },
        },
      },
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
