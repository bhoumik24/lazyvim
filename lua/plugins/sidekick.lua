return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        antigravity = {
          cmd = { "agy" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "opencode", focus = true })
      end,
      desc = "Sidekick OpenCode toggle",
    },
  },
}

