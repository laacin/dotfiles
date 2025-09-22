return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_lsp", "prettier" },
      typescript = { "eslint_lsp", "prettier" },
      typescriptreact = { "eslint_lsp", "prettier" },
      javascriptreact = { "eslint_lsp", "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
  },
}
