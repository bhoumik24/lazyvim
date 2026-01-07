vim.filetype.add({ extension = { templ = "templ" } })
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    opts = { ensure_installed = { "templ" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        templ = {},
        html = {
          filetypes = { "html", "templ" },
        },
        tailwindcss = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                templ = "html",
              },
            },
          },
        },
      },
    },
  },
  {
    "catgoose/templ-goto-definition",
    ft = { "go", "templ" },
    config = function()
      require("templ-goto-definition").setup()
      
      -- LazyVim maps 'gd' to a picker (like Snacks or Telescope) by default.
      -- This plugin overrides vim.lsp.buf.definition(), so we need to ensure 'gd' calls that.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("TemplGotoDef", { clear = true }),
        callback = function(ev)
          local filetype = vim.bo[ev.buf].filetype
          if filetype == "go" or filetype == "templ" then
            vim.schedule(function()
              vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
              end, { buffer = ev.buf, desc = "Goto Definition (templ compatible)" })
            end)
          end
        end,
      })
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
