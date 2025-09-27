local m = require("config.keymaps.utils")
local c = require("core.constants")
local builtin = require("telescope.builtin")

local find_files = function()
  builtin.find_files({
    cwd = c.ROOT_DIR(),
  })
end

local live_grep = function()
  builtin.live_grep({
    cwd = c.ROOT_DIR(),
  })
end

local buffers = function()
  builtin.buffers({
    cwd = c.ROOT_DIR(),
  })
end

local desc = function(desc)
  return m.desc(desc, "󰭎")
end

m.setGroup("<leader>f", desc("Telescope"))
m.setKey("<leader>ff", desc("Find files"), find_files)
m.setKey("<leader>fw", desc("Find words"), live_grep)
m.setKey("<leader>fb", desc("Buffers"), buffers)
m.setKey("<leader>fo", desc("Oldfiles"), builtin.oldfiles)
