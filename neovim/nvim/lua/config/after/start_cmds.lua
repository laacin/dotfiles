local c = require("core.constants")

-- colorscheme
vim.cmd.colorscheme(c.COLORSCHEME)

-- cursorline
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#D7AF5F" })
vim.api.nvim_set_hl(0, "CursorLine", { underline = false })

-- Disable float tabs background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.o.winborder = "single"

-- Tree-sitter
vim.cmd("TSEnable highlight")
