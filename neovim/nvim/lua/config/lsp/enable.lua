local M = {}

M.rust = {
  "rust_analyzer",
}

M.typescript = {
  "vtsls",
  "jsonls",
  "html",
  "cssls",
}

local lsp_servers = {
  "lua_ls",
  -- "gopls",
  -- "vtsls",
  -- "rust_analyzer",
  -- "jsonls",
  -- "html",
  -- "cssls",
  "eslint",
}

vim.lsp.enable(lsp_servers)
