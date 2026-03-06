local c = require("core.constants")

vim.lsp.config("*", {
  root_dir = c.ROOT_DIR(),
  capabilities = require("blink-cmp").get_lsp_capabilities(),
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

vim.lsp.enable(require("core.ensure_installed").lsps)
