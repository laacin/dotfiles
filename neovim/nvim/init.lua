local fs = require("core.imports")
local bootstrap = require("core.bootstrap")

local cfg = {
  before = fs.read_files("config/before", true),
  after = fs.read_files("config/after", true),
}

fs.load(cfg.before)
bootstrap.setup("plugins") -- Lazy setup
fs.load(cfg.after)
