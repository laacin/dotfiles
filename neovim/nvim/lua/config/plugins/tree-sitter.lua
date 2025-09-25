local pkg = require("core.ensure_installed").treesitter

require("nvim-treesitter.configs").setup({
  ensure_installed = pkg,
  highlights = {
    enable = true,
  },
  ident = {
    enable = true,
  },
})
