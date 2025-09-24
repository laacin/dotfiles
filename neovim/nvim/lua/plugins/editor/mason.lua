local pkg = require("core.ensure_installed")

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "vtsls",
    },
    run_on_start = true,
  },
}
