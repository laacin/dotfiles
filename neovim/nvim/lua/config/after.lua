-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Disable transparency
vim.api.nvim_create_user_command("DisableTransparency", function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#030303" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#030303" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#030303" })
end, {})

vim.api.nvim_create_user_command("EnableTransparency", function()
  vim.cmd.colorscheme("catppuccin")
end, {})
