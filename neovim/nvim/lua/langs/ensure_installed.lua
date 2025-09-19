-- Essential
local essential_mason = {
  "lua-language-server",
  "stylua",
  "shfmt",
  "tree-sitter-cli",
}

local essential_treesitter = {
  "lua",
}

-- Go
local go_mason = {
  "gopls",
  "goimports",
  "gofumpt",
  "gomodifytags",
  "impl",
  "delve",
}

local go_treesitter = {
  "go",
  "gomod",
  "gowork",
  "gosum",
}

-- Typescript
local typescript_mason = {
  "vtsls",
  "eslint_d",
  "prettier",
  "stylelint",
  "html-lsp",
  "css-lsp",
}

local typescript_treesitter = {
  "typescript",
  "tsx",
  "javascript",
  "json5",
  "html",
  "css",
  "scss",
  "yaml",
}

-- Rust
local rust_mason = {
  "rust-analyzer",
}

local rust_treesitter = {
  "rust",
}

-- Extra
local extra_mason = {
  "taplo",
  "dockerfile-language-server",
  "sqlls",
  "sql-formatter",
  "sqlfluff",
  "sqlfmt",
}

local extra_treesitter = {
  "toml",
  "dockerfile",
  "sql",
  "git_config",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "gitattributes",
}

-- Unpacking
local ensure_installed = {
  mason = {
    essential_mason,
    go_mason,
    typescript_mason,
    rust_mason,
    extra_mason,
  },

  treesitter = {
    essential_treesitter,
    go_treesitter,
    typescript_treesitter,
    rust_treesitter,
    extra_treesitter,
  },
}

return ensure_installed
