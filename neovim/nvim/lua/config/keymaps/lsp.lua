local m = require("config.keymaps.utils")

-- LSP
m.setGroup("<leader>d", m.desc("LSP", ""))

-- Info
m.setKey("<leader>dI", m.desc("Info", ""), "<CMD>LspInfo<CR>")

-- Diagnostics
m.setKey("<leader>de", m.desc("Show diagnostic", "󰒡"), function()
  vim.diagnostic.open_float(nil, { border = "single" })
end)

m.setKey("<leader>dE", m.desc("Show ALL diagnostics", "󰒡"), function()
  vim.diagnostic.open_float(nil, { border = "single" })
end)
