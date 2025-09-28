local m = require("config.keymaps.utils")
local oil = require("oil")

-- -- -- -- Generals
-- Oil
m.setKey("m", false, "q") -- remap macro
m.setKey("r", false, "<Nop>")
m.setKey("q", false, "<CMD>Oil<CR>")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    m.setKey("r", false, oil.select, { buffer = 0 })
  end,
})

-- -- -- -- With <leader>
-- Open Lazy
m.setKey("<leader>l", m.desc("Lazy", "󰒲"), "<CMD>Lazy<CR>")

-- Toggle Neotree
m.setKey("<leader>e", m.desc("Toggle Neo-tree", "󰙅"), "<CMD>Neotree toggle<CR>")

-- Dashboard
m.setKey("<leader>h", m.desc("Dashboard", "󰋜"), "<CMD>Alpha<CR>")
