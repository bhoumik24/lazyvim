return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.markdownlint-cli2.jsonc"), "--" },
      },
      staticcheck = {
        cmd = "staticcheck",
        stdin = false,
        args = { "-f", "json" },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local severities = {
            error = vim.diagnostic.severity.ERROR,
            warning = vim.diagnostic.severity.WARN,
            ignored = vim.diagnostic.severity.INFO,
          }
          local result = vim.fn.split(output, "\n")
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local diagnostics = {}
          for _, message in ipairs(result) do
            if message ~= "" then
              local ok, decoded = pcall(vim.json.decode, message)
              if ok and decoded and decoded.location and decoded.location.file == bufname then
                local lnum = math.max(0, decoded.location.line - 1)
                local col = math.max(0, decoded.location.column - 1)
                local end_lnum = (decoded["end"] and decoded["end"]["line"] > 0) and (decoded["end"]["line"] - 1) or nil
                local end_col = (decoded["end"] and decoded["end"]["column"] > 0) and (decoded["end"]["column"] - 1) or nil

                table.insert(diagnostics, {
                  lnum = lnum,
                  col = col,
                  end_lnum = end_lnum,
                  end_col = end_col,
                  code = decoded.code,
                  user_data = {
                    lsp = {
                      code = decoded.code,
                    },
                  },
                  severity = severities[decoded.severity] or vim.diagnostic.severity.WARN,
                  message = decoded.message,
                })
              end
            end
          end
          return diagnostics
        end,
      },
    },
    linters_by_ft = {
      go = { "staticcheck" },
    },
  },
}

