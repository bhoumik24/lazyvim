return {
  name = "Clean",
  builder = function()
    local ex = vim.fn.expand("%:p:r")
    return {
      cmd = {
        "rm",
      },
      args = {
        ex,
      },
      components = {
        {
          "dependencies",
          task_names = {
            {
              cmd = {
                "rm",
              },
              args = {
                "-r",
                "-f",
                ex .. ".dSYM",
              },
            },
          },
        },
        "default",
      },
    }
  end,
}
