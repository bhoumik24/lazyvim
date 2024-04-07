-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})

vim.filetype.add({ extension = { templ = "templ" } })
