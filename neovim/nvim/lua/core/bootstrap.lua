local c = require("core.constants")

-- Bootstrap lazy.nvim
local lazypath = c.DATA_PATH() .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy
local fs = require("core.imports")
local M = {}

M.setup = function(plugins)
  local result = {}
  local values = fs.read_dirs(plugins, true)

  for _, mod in ipairs(values) do
    table.insert(result, { import = mod })
  end

  require("lazy").setup({
    spec = result,
    ui = {
      border = "single",
    },
  })
end

return M
