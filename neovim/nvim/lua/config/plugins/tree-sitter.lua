local pkg = require("core.ensure_installed").treesitter

require("nvim-treesitter.configs").setup({
  auto_install = true,
  ensure_installed = pkg,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  modules = {},
  sync_install = false,
  ignore_install = {},
})
