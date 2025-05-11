-- Colorscheme
vim.cmd.colorscheme("catppuccin")

-- Disable transparency
vim.api.nvim_create_user_command("DisableTransparency", function()
  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
  })
  vim.cmd.colorscheme("catppuccin")
end, {})

vim.api.nvim_create_user_command("EnableTransparency", function()
  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
  })
  vim.cmd.colorscheme("catppuccin")
end, {})
