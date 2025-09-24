-- local unpkger = require("utils.unpackager").unpacking
-- local pkg = require("ensure_installed").treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
}
