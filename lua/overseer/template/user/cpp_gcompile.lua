return {
  name = "Compile for debug",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local outFile = vim.fn.expand("%:p:r")
    return {
      cmd = {
        "clang++",
        "-I/opt/homebrew/include",
        "-std=c++20",
        "-Wall",
        "-Weffc++",
        "-Wextra",
        "-Wconversion",
        "-Wno-sign-conversion",
        "-Werror",
      },
      args = {
        "-glldb",
        "-fstandalone-debug",
        "-o",
        outFile,
        file,
      },
      components = {
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
