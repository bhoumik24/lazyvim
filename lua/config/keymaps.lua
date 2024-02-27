-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- Terminal rounded border
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, {
    border = "rounded",
    size = {
      width = 50,
      height = 30,
    },
    style = "minimal",
    margin = {
      top = -25,
      left = 35,
      right = -100,
      bottom = 35,
    },
  })
end, { desc = "Term with border" })
