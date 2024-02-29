return {
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search/Replace on current file",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Search/Replace current word",
      },
    },
  },
}
