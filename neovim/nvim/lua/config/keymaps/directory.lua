local c = require("core.constants")
local m = require("config.keymaps.utils")

m.setGroup("<leader>r", m.desc("Directory", ""))
-- Go to root
m.setKey("<leader>rr", m.desc("Go to root", ""), function()
  require("oil").open(c.ROOT_DIR())
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
