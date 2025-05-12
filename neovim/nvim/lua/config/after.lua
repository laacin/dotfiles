-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Enable/Disable background
vim.api.nvim_create_user_command("DisableBackground", function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
end, {})

vim.api.nvim_create_user_command("EnableBackground", function()
  vim.cmd.colorscheme("catppuccin")
end, {})
