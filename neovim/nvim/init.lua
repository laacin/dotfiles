local fs = require("core.imports")
local bootstrap = require("core.bootstrap")

local plugins = fs.read_dirs("plugins", true)
local config = {
  before = fs.read_files("config/before", true),

  plugins = fs.read_files("config/plugins", true),

  lsps = fs.read_files("config/lsp", true),
  cmds = fs.read_files("config/cmds", true),
  keymaps = fs.read_files("config/keymaps", true),
}

-- Init
fs.load(config.before)

bootstrap.setup(plugins) -- Lazy setup

fs.load(config.plugins)
fs.load(config.lsps)
fs.load(config.cmds)
fs.load(config.keymaps)
