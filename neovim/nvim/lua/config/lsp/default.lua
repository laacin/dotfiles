local c = require("core.constants")

vim.lsp.config("*", {
  root_dir = c.ROOT_DIR(),
  -- capabilities = require("blink-cmp").get_lsp_capabilities(),
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

vim.lsp.enable(require("core.ensure_installed").lsps)

-- -- Identation
-- global default 2
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})
