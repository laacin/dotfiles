local oil = require("oil")
local c = require("core.constants")
local m = require("config.keymaps.utils")

m.setGroup("<leader>r", m.desc("Directory", ""))
-- Go to root
m.setKey("<leader>rr", m.desc("Go to root", ""), function()
  oil.open(c.ROOT_DIR())
end)

-- Set new root
m.setKey("<leader>rR", m.desc("Set as root", ""), function()
  if vim.bo.filetype ~= "oil" then
    vim.notify("Oil buffer required to set root", "warn")
    return
  end

  c.SET_ROOT_DIR(require("oil").get_current_dir())

  vim.cmd("LspRestart")
end)

-- Show root dir
m.setKey("<leader>rs", m.desc("Show info", ""), function()
  vim.notify("Project: " .. c.PROJECT_NAME() .. "\n" .. "Root: " .. vim.fn.fnamemodify(c.ROOT_DIR(), ":~"))
end)

-- Open prev dir
local prev_dir = c.ROOT_DIR()
m.setKey("<leader>rN", m.desc("Go to prev root", ""), function()
  if c.ROOT_DIR() == prev_dir then
    oil.open(c.ROOT_DIR())
    return
  end

  local current = c.ROOT_DIR()
  c.SET_ROOT_DIR(prev_dir)
  oil.open(prev_dir)

  prev_dir = current
  vim.cmd("LspRestart")
end)
