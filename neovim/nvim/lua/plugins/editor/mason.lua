local pkg = require("langs.ensure_installed").mason

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = require("utils.unpacking")(pkg),
    ui = {
      border = "single",
    },
  },
}
