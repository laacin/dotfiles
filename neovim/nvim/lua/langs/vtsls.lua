-- Typescript / JavaScript / Frontend
vim.lsp.config("vtsls", {
  settings = {
    typescript = { format = { enable = true } },
    javascript = { format = { enable = true } },
  },
})

vim.lsp.config("eslint_d", {
  settings = {
    codeActionsOnSave = { enable = true },
  },
})

vim.lsp.config("prettier", {
  settings = {
    printWidth = 100,
    tabWidth = 2,
  },
})

vim.lsp.config("stylelint", {
  settings = {
    lint = { enable = true },
  },
})

vim.lsp.config("html-lsp", {
  settings = {
    html = { format = { enable = true } },
  },
})

vim.lsp.config("css-lsp", {
  settings = {
    css = { format = { enable = true } },
  },
})
