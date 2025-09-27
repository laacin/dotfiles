local m = require("config.keymaps.utils")

-- -- LSP
m.setGroup("<leader>d", m.desc("LSP", ""))

-- Info
m.setKey("<leader>dS", m.desc("Info", ""), "<CMD>LspInfo<CR>")
m.setKey("<leader>ds", m.desc("Currently active", ""), function()
  local clients = vim.lsp.get_clients()
  local names = {}

  for _, cl in pairs(clients) do
    table.insert(names, cl.name)
  end

  vim.notify(table.concat(names, "\n"))
end)

-- Diagnostics
m.setKey("<leader>de", m.desc("Show diagnostic", "󰒡"), function()
  vim.diagnostic.open_float(nil, { border = "single" })
end)

m.setKey("<leader>dE", m.desc("Show ALL diagnostics", "󰒡"), function()
  vim.diagnostic.setloclist({ open = true, border = "single" })
end)

-- Restart
m.setKey("<leader>dR", m.desc("Restart", ""), "<CMD>LspRestart<CR>")

-- Triggers
m.setKey("<leader>dD", m.desc("Analyze project"), function()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    if client.config.root_dir then
      -- trigger workspace diagnostics si el LSP soporta
      if client.workspace_did_change then
        client.workspace_did_change()
      end
    end
  end
  vim.notify("Project diagnostics triggered")
end)
