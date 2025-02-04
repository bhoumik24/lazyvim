-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.laststatus = 3

-- nu shell settings
-- path to the Nushell executable
vim.opt.sh = "nu"

-- WARN: disable the usage of temp files for shell commands
-- because Nu doesn't support `input redirection` which Neovim uses to send buffer content to a command:
--      `{shell_command} < {temp_file_with_selected_buffer_content}`
-- When set to `false` the stdin pipe will be used instead.
-- NOTE: some info about `shelltemp`: https://github.com/neovim/neovim/issues/1008
vim.opt.shelltemp = false

-- string to be used to put the output of shell commands in a temp file
-- 1. when 'shelltemp' is `true`
-- 2. in the `diff-mode` (`nvim -d file1 file2`) when `diffopt` is set
--    to use an external diff command: `set diffopt-=internal`
vim.opt.shellredir = "out+err> %s"

-- flags for nu:
-- * `--stdin`       redirect all input to -c
-- * `--no-newline`  do not append `\n` to stdout
-- * `--commands -c` execute a command
vim.opt.shellcmdflag = "--stdin --no-newline -c"

-- disable all escaping and quoting
vim.opt.shellxescape = ""
vim.opt.shellxquote = ""
vim.opt.shellquote = ""

-- string to be used with `:make` command to:
-- 1. save the stderr of `makeprg` in the temp file which Neovim reads using `errorformat` to populate the `quickfix` buffer
-- 2. show the stdout, stderr and the return_code on the screen
-- NOTE: `ansi strip` removes all ansi coloring from nushell errors
vim.opt.shellpipe =
  "| complete | update stderr { ansi strip } | tee { get stderr | save --force --raw %s } | into record"

-- end nushell settings

vim.lsp.set_log_level("off")

vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})

vim.filetype.add({ extension = { templ = "templ" } })
vim.g.codeium_enabled = false
vim.filetype.add({ extension = { template = "yaml" } })

-- vim.keymap.set(
--   "n",
--   "<leader>e",
--   [[<CMD>lua require("oil").toggle_float()<CR>]],
--   { noremap = true, silent = true, desc = "Toggle Oil" }
-- )

-- ############################################################################
--                             Neovide section
-- ############################################################################

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  -- This allows me to use cmd+v to paste stuff into neovide
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

  -- produce particles behind the cursor, to disable, set it to ""
  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  -- Display
  vim.g.neovide_transparency = 0.80
  vim.g.neovide_window_blurred = true
  -- vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.snacks_animate = false
  vim.g.snacks_scroll = false

  -- This is how fast the cursor animation "moves", default 0.06
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  -- Dynamically change scale at runtime
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)

  -- Neovide terminal colors
  vim.g.terminal_color_0 = "#3c3836"
  vim.g.terminal_color_1 = "#cc241d"
  vim.g.terminal_color_2 = "#98971a"
  vim.g.terminal_color_3 = "#d79921"
  vim.g.terminal_color_4 = "#458588"
  vim.g.terminal_color_5 = "#b16286"
  vim.g.terminal_color_6 = "#689d6a"
  vim.g.terminal_color_7 = "#a89984"
  vim.g.terminal_color_8 = "#928374"
  vim.g.terminal_color_9 = "#fb4934"
  vim.g.terminal_color_10 = "#b8bb26"
  vim.g.terminal_color_11 = "#fabd2f"
  vim.g.terminal_color_12 = "#83a598"
  vim.g.terminal_color_13 = "#d3869b"
  vim.g.terminal_color_14 = "#8ec07c"
  vim.g.terminal_color_15 = "#fbf1c7"
end

vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor", -- Use 'Cursor' highlight for normal, visual, and command modes
  "i-ci-ve:ver25-lCursor", -- Use 'lCursor' highlight for insert and visual-exclusive modes
  "r-cr:hor20-CursorIM", -- Use 'CursorIM' for replace mode
}
