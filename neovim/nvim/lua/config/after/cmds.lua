local c = require("core.constants")

-- Enable/Disable background
vim.api.nvim_create_user_command("DisableBackground", function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
end, {})

vim.api.nvim_create_user_command("EnableBackground", function()
  vim.cmd.colorscheme(c.COLORSCHEME)
end, {})

-- Compile blink-cmp
vim.api.nvim_create_user_command("BuildBlink", function()
  local path = vim.fn.stdpath("data") .. "/lazy/blink.cmp"
  vim.cmd("!cd " .. path .. " && cargo build --release")
end, {})

-- Checkhealth vim.lsp
vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, {})
