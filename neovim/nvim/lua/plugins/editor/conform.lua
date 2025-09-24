return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "eslint_lsp", "prettier" },
      typescript = { "eslint_lsp", "prettier" },
      typescriptreact = { "eslint_lsp", "prettier" },
      javascriptreact = { "eslint_lsp", "prettier" },
      json = { "eslint_lsp", "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
