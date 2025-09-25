local c = require("core.constants")
local m = require("config.keymaps.utils")

-- -- -- -- Generals
-- Oil
m.setKey("-", false, "<CMD>Oil<CR>")

-- -- -- -- With leader
-- Open Lazy
m.setKey("<leader>l", m.desc("Lazy", "󰒲"), "<CMD>Lazy<CR>")

-- Toggle Neotree
m.setKey("<leader>e", m.desc("Toggle Neo-tree", "󰙅"), "<CMD>Neotree toggle<CR>")

-- Home menu -- BUG
-- setKey("<leader>h", opts("Dashboard", "󰋜"), function()
--   require("snacks.dashboard").open()
-- end)

-- Go to root
m.setKey("<leader>r", m.desc("Go to root directory", "󰉓"), function()
  require("oil").open(c.ROOTDIR)
end)
