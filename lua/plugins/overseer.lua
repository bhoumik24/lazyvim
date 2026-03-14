return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo", "OverseerBuild" },
    opts = function(_, opts)
      opts.templates = { "builtin", "user.cpp_build", "user.cpp_gcompile", "user.cpp_clean", "user.cpp_run" }
      -- opts.bindings = { ["q"] = "Close" }

      table.insert(opts.task_win, {
        bindings = {
          ["q"] = "Close",
        },
      })

      local overseer = require("overseer")

      overseer.add_template_hook({
        module = "^make$",
      }, function(task_defn, util)
        util.add_component(task_defn, { "open_output", direction = "dock", focus = true, on_start = "always" })
      end)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, { "overseer" })
    end,
  },
}
