local M = {}

-- -- -- MASON
M.mason = {
  -- Lua
  "lua-language-server",
  "stylua",

  -- Typescript
  "vtsls",
  "eslint-lsp",
  "prettier",
  "stylelint",
  "css-lsp",
  "html-lsp",
  "json-lsp",

  -- Go
  "gopls",
  "goimports",
  "gofumpt",

  -- Rust
  "rust-analyzer",

  -- Extra
  "tree-sitter-cli",
  "taplo",
  "dockerfile-language-server",
  "sqlls",
  "sql-formatter",
  "shfmt",
  "tombi",
  "astro-language-server",
}

-- -- -- LSPs
M.lsps = {
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

-- -- -- TREESITTER
M.treesitter = {
  -- Lua
  "lua",

  -- Typescript
  "typescript",
  "tsx",
  "javascript",
  "json",
  "json5",
  "html",
  "css",
  "scss",
  "yaml",

  -- Go
  "go",
  "gomod",
  "gowork",
  "gosum",

  -- Rust
  "rust",

  -- Extra
  "toml",
  "dockerfile",
  "sql",
  "gitignore",
  "astro",
}

return M
