-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- Terminal rounded border
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, {
    cwd = Util.root(),
    border = "solid",
    size = {
      width = 50,
      height = 30,
    },
    style = "minimal",
    margin = {
      top = -25,
      left = 65,
      right = -100,
      bottom = 35,
    },
  })
end, { desc = "Term with border" })
