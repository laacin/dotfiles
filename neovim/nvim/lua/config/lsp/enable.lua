local lsp_servers = {
  -- Lua
  "lua_ls",

  -- Go
  "gopls",

  -- Typescript
  "vtsls",
  "jsonls",
  "html",
  "cssls",
  "eslint",
  "astro",

  -- Rust
  "rust_analyzer",

  -- Extra
  "dockerls",
  "sqlls",
  "tombi",
}

vim.lsp.enable(lsp_servers)
