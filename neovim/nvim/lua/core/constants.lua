local M = {}

-- Root dir
M.ROOTDIR = vim.fn.getcwd()
M.PROJECTNAME = vim.fn.fnamemodify(M.ROOTDIR, ":t")

-- Standard path
M.ROOTCONFIG = vim.fn.stdpath("config") .. "/lua/"
M.ROOTDATA = vim.fn.stdpath("data")

-- Colorscheme
M.COLORSCHEME = "catppuccin-mocha"

return M
