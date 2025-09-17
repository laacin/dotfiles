local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local root_file = {
  ".stylelintrc",
  ".stylelintrc.mjs",
  ".stylelintrc.cjs",
  ".stylelintrc.js",
  ".stylelintrc.json",
  ".stylelintrc.yaml",
  ".stylelintrc.yml",
  "stylelint.config.mjs",
  "stylelint.config.cjs",
  "stylelint.config.js",
}

root_file = util.insert_package_json(root_file, "stylelint")

lspconfig.stylelint_lsp.setup({
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = {
    "astro",
    "css",
    "html",
    "less",
    "scss",
    "sugarss",
    "vue",
    "wxss",
  },
  root_dir = util.root_pattern(unpack(root_file)),
  settings = {},
})

lspconfig.cssls.setup({
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

return {}
