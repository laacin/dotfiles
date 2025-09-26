local fs = require("core.imports")
local bootstrap = require("core.bootstrap")

local cfg = {
  before = fs.read_files("config/before", true),
  plugin_conf = fs.read_files("config/plugins", true),
  cmds = fs.read_files("config/cmds", true),
  keymaps = fs.read_files("config/keymaps", true),
  lsp_conf = fs.read_files("config/lsp", true),
}

fs.load(cfg.before)
bootstrap.setup("plugins") -- Lazy setup

fs.load(cfg.plugin_conf)
fs.load(cfg.lsp_conf)
fs.load(cfg.cmds)
fs.load(cfg.keymaps)
