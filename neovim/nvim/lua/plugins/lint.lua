return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        go = { "golangci-lint", "goimports" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        rust = { "rustfmt" },
        html = { "htmlhint" },
        css = { "stylelint" },
        bash = { "shellcheck" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        markdown = { "markdownlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
