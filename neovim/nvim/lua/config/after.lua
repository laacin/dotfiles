-- Colorscheme
local colorscheme = "catppuccin"
vim.cmd.colorscheme(colorscheme)

-- Enable/Disable background
vim.api.nvim_create_user_command("DisableBackground", function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
end, {})

vim.api.nvim_create_user_command("EnableBackground", function()
  vim.cmd.colorscheme(colorscheme)
  vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#D7AF5F" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", ctermbg = "NONE" })
end, {})
