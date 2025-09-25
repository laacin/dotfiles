local m = require("config.keymaps.utils")

-- Windows
m.setGroup("<leader>w", m.desc("Windows", ""))

-- Move
m.setKey("<leader>wk", m.desc("Up", ""), "<C-w>k") -- Up
m.setKey("<leader>wj", m.desc("Down", ""), "<C-w>j") -- Down
m.setKey("<leader>wl", m.desc("Left", ""), "<C-w>l") -- Left
m.setKey("<leader>wh", m.desc("Right", ""), "<C-w>h") -- Right
m.setKey("<leader>wq", m.desc("Close", ""), "<C-w>c") -- Close

-- Vertical split
m.setKey("<leader>wv", m.desc("Vertical split", ""), function()
  vim.cmd("vsplit")
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local prev = wins[1]
  local cur = wins[2]
  local total = vim.api.nvim_win_get_width(prev) + vim.api.nvim_win_get_width(cur)

  vim.api.nvim_win_set_width(prev, math.floor(total * 2 / 3))
  vim.api.nvim_win_set_width(cur, math.floor(total * 1 / 3))
end)

-- Horizontal split
m.setKey("<leader>ws", m.desc("Horizontal split", ""), function()
  vim.cmd("split")
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local prev = wins[1]
  local cur = wins[2]
  local total = vim.api.nvim_win_get_height(prev) + vim.api.nvim_win_get_height(cur)

  vim.api.nvim_win_set_height(prev, math.floor(total * 2 / 3))
  vim.api.nvim_win_set_height(cur, math.floor(total * 1 / 3))
end)

-- -- Resizing
m.setGroup("<leader>wr", m.desc("Rezise", "󰙖"))

-- Width
m.setKey("<leader>wrl", m.desc("Increase width", "󰞓"), "<CMD>vertical resize +20<CR>")
m.setKey("<leader>wrh", m.desc("Decrease width", "󰞔"), "<CMD>vertical resize -20<CR>")

-- Height
m.setKey("<leader>wrk", m.desc("Increase height", "󰞕"), "<CMD>resize +10<CR>")
m.setKey("<leader>wrj", m.desc("Decrease height", "󰞒"), "<CMD>resize -10<CR>")

-- Equalize
m.setKey("<leader>wre", m.desc("Equalize splits", ""), "<C-w>=")
