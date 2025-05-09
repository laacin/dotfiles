return {
  -- Mason
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = true,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "vtsls",
          "lua_ls",
          "gopls",
          "vimls",
          "rust_analyzer",
        },
        automatic_enable = {
          "vtsls",
          "lua_ls",
          "gopls",
          "vimls",
          "rust_analyzer",
        },
      }
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- LSPs
          "vtsls",
          "lua_ls",
          "gopls",
          "vimls",
          "rust_analyzer",

          -- Formatters
          "prettier",
          "stylua",
          "gofumpt",
          "goimports",

          -- Linters
          "eslint_d",
          "luacheck",
          "golangci-lint",
        },
        auto_update = false,
        run_on_start = true,
      }
    end,
  },
}
