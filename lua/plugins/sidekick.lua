return {
  "folke/sidekick.nvim",
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
