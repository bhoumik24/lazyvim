-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Set cursor back to vertical bar when exiting Vim

vim.api.nvim_create_autocmd("VimLeave", {
  group = augroup("RestoreCursorShapeOnExit"),
  callback = function()
    vim.o.guicursor = "a:ver20"
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Disable transparent background in Catppuccin when using Neovide",
  callback = function()
    if vim.g.neovide then
      -- Update Catppuccin configuration
      require("catppuccin").setup({
        transparent_background = false,
      })
      -- Re-apply the colorscheme to activate changes
      vim.cmd.colorscheme("catppuccin")
    end
  end,
})
