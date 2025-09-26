local c = require("core.constants")
local set_cmd = vim.api.nvim_create_user_command

-- Toggle background
local bg = false
set_cmd("Background", function()
  bg = not bg

  if bg then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
  else
    vim.cmd.colorscheme(c.COLORSCHEME())
  end
end, {})

-- Compile blink-cmp
set_cmd("BuildBlink", function()
  local path = c.DATA_PATH() .. "lazy/blink.cmp"
  vim.cmd("!cd " .. path .. " && cargo build --release")
end, {})

-- Checkhealth vim.lsp
set_cmd("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, {})

-- Restart LSPs
---@diagnostic disable: missing-parameter
set_cmd("LspRestart", function()
  vim.lsp.stop_client(vim.lsp.get_clients(), true)
  vim.lsp.config("*", {
    root_dir = c.ROOT_DIR(),
  })
  vim.cmd("edit")
end, {})
