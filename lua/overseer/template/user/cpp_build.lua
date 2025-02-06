return {
  name = "C++ build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local outFile = vim.fn.expand("%:p:r") .. ".out"
    return {
      cmd = {
        "c++",
        "-I/opt/homebrew/include",
        "-std=c++20",
        "-Wall",
        "-Weffc++",
        "-Wextra",
        "-Wconversion",
        "-Wsign-conversion",
        "-Werror",
      },
      args = {
        "-o",
        outFile,
        file,
      },
      components = {
        { "on_output_parse", problem_matcher = "$gcc" },
        { "on_result_diagnostics_trouble", close = true },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
