local M = {}

-- Standard path
M.ROOTCONFIG = vim.fn.stdpath("config") .. "/lua/"
M.ROOTDATA = vim.fn.stdpath("data")

-- Colorscheme
M.COLORSCHEME = "catppuccin-mocha"

return M
