local c = require("core.constants")

vim.lsp.config("*", {
  root_dir = c.ROOT_DIR(),
  capabilities = require("blink-cmp").get_lsp_capabilities(),
})

vim.diagnostic.config({
  virtual_text = true,
})
