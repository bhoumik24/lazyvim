return {
  name = "C++ build and run",
  builder = function()
    -- Full path to current file (see :help expand())
    local outFile = vim.fn.expand("%:p:r") .. ".out"
    return {
      cmd = { outFile },
      components = {
        {
          "dependencies",
          task_names = {
            "C++ build",
          },
        },
        { "open_output", direction = "dock", focus = true, on_start = "always" },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
