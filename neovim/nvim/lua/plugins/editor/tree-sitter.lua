local pkg = require("langs.ensure_installed").treesitter

return {
  "nvim-treesitter",
  opts = {
    ensure_installed = require("utils.unpacking")(pkg),
  },
}
