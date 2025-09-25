local M = {}

-- Root dir
local root_directory = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_directory, ":t")

M.ROOT_DIR = function()
  return root_directory
end

M.PROJECT_NAME = function()
  return project_name
end

M.SET_ROOT_DIR = function(directory)
  directory = directory:gsub("/$", "")
  root_directory = directory
  project_name = vim.fn.fnamemodify(root_directory, ":t")
end

-- Standard path
M.ROOTCONFIG = vim.fn.stdpath("config") .. "/lua/"
M.ROOTDATA = vim.fn.stdpath("data")

-- Colorscheme
M.COLORSCHEME = "catppuccin-mocha"

return M
