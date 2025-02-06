return {
  "stevearc/overseer.nvim",
  opts = function(_, opts)
    opts.templates = { "builtin", "user.cpp_build", "user.cpp_gcompile", "user.cpp_clean", "user.cpp_run" }
    -- opts.bindings = { ["q"] = "Close" }

    table.insert(opts.task_win, { bindings = {
      ["q"] = "Close",
    } })

    local overseer = require("overseer")

    overseer.add_template_hook({
      module = "^make$",
    }, function(task_defn, util)
      util.add_component(task_defn, { "open_output", direction = "dock", focus = true, on_start = "always" })
    end)
  end,
}
