-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert like <Esc>" })

-- Toggle background transparency (Neovide opacity & terminal Catppuccin transparency)
local default_neovide_opacity = vim.g.neovide_opacity or 0.9
local default_neovide_normal_opacity = vim.g.neovide_normal_opacity or 1.0
local is_terminal_transparent = vim.g.neovide ~= true

vim.keymap.set("n", "<leader>uo", function()
  if vim.g.neovide then
    if (vim.g.neovide_opacity or 1.0) < 1.0 or (vim.g.neovide_normal_opacity or 1.0) < 1.0 then
      -- Turn transparency OFF (fully opaque)
      vim.g.neovide_opacity = 1.0
      vim.g.neovide_normal_opacity = 1.0
      vim.notify("Neovide transparency disabled (opaque)", vim.log.levels.INFO, { title = "Neovide" })
    else
      -- Turn transparency ON (restore defaults)
      vim.g.neovide_opacity = default_neovide_opacity
      vim.g.neovide_normal_opacity = default_neovide_normal_opacity
      vim.notify(
        string.format("Neovide transparency enabled (opacity: %s, normal: %s)", default_neovide_opacity, default_neovide_normal_opacity),
        vim.log.levels.INFO,
        { title = "Neovide" }
      )
    end
  else
    -- Terminal Neovim transparency toggle (for Catppuccin colorscheme)
    local ok, cat = pcall(require, "catppuccin")
    if ok then
      cat.options.transparent_background = not cat.options.transparent_background
      cat.compile()
      vim.cmd.colorscheme("catppuccin")
      if cat.options.transparent_background then
        vim.notify("Catppuccin transparency enabled", vim.log.levels.INFO, { title = "Theme" })
      else
        vim.notify("Catppuccin transparency disabled (opaque)", vim.log.levels.INFO, { title = "Theme" })
      end
    else
      vim.notify("Catppuccin theme not loaded", vim.log.levels.ERROR)
    end
  end
end, { desc = "Toggle background transparency" })


-- local Util = require("lazyvim.util")
--
-- -- Terminal rounded border
-- vim.keymap.set("n", "<C-/>", function()
--   Util.terminal(nil, {
--     cwd = Util.root(),
--     border = "solid",
--     size = {
--       width = 50,
--       height = 30,
--     },
--     style = "minimal",
--     margin = {
--       top = -25,
--       left = 65,
--       right = -100,
--       bottom = 35,
--     },
--   })
-- end, { desc = "Term with border" })
