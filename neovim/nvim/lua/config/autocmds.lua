-- ColorScheme
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("colorscheme_augroup", { clear = true }),
  callback = function()
    -- Cursorline
    vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#D7AF5F" })
    vim.api.nvim_set_hl(0, "CursorLine", { underline = false })

    -- Disable float tabs background
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})
