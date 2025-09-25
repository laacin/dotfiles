local c = require("core.constants")
local iswk, wk = pcall(require, "which-key")

local opts = function(desc, icon)
  desc = desc or false

  if not desc then
    return false
  elseif not iswk then
    return { desc = desc }
  else
    icon = icon or ""
    return { desc = desc, icon = icon }
  end
end

local setKey = function(key, desc, fallback)
  key = key or false
  fallback = fallback or false
  if not key or not fallback then
    return
  end

  if not desc then
    return vim.keymap.set("n", key, fallback)
  elseif not iswk then
    return vim.keymap.set("n", key, fallback, desc.desc)
  end

  wk.add({
    { key, fallback, desc = desc.desc, icon = desc.icon },
  })
end

local setGroup = function(key, desc)
  if not iswk then
    return
  end
  wk.add({
    { key, group = desc.desc, icon = desc.icon },
  })
end

-- -- -- -- -- KEYMAPS

-- Open Lazy
setKey("<leader>l", opts("Lazy", "󰒲"), "<CMD>Lazy<CR>")

-- Oil
setKey("-", false, "<CMD>Oil<CR>")

-- Toggle Neotree
setKey("<leader>e", opts("Toggle Neo-tree", "󰙅"), "<CMD>Neotree toggle<CR>")

-- LSP logs
setGroup("<leader>d", opts("LSP", ""))
setKey("<leader>de", opts("Logs", "󰒡"), function()
  vim.diagnostic.open_float(nil, { border = "single" })
end)

setKey("<leader>dE", opts("Logs (ALL)", "󰒡"), function()
  vim.diagnostic.open_float(nil, { border = "single" })
end)

-- Home menu -- BUG
-- setKey("<leader>h", opts("Dashboard", "󰋜"), function()
--   require("snacks.dashboard").open()
-- end)

-- Go to root
setKey("<leader>r", opts("Go to root directory", "󰉓"), function()
  require("oil").open(c.ROOTDIR)
end)
