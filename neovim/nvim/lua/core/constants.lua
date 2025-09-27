local M = {}

-- -- -- -- -- DEFAULT VALUES
local root_directory = vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_directory, ":t")

local config_path = vim.fn.stdpath("config")
local data_path = vim.fn.stdpath("data")

local colorscheme = "catppuccin-mocha"

-- -- -- GETTERS - SETTERS
-- Root dir | Project name
M.ROOT_DIR = function()
  return root_directory
end

M.SET_ROOT_DIR = function(directory)
  directory = directory:gsub("/$", "")
  root_directory = directory
  project_name = vim.fn.fnamemodify(root_directory, ":t")
end

M.PROJECT_NAME = function()
  return project_name
end

-- Standard path
M.CONFIG_PATH = function()
  return config_path
end

M.DATA_PATH = function()
  return data_path
end

-- Colorscheme
M.COLORSCHEME = function()
  return colorscheme
end

M.SET_COLORSCHEME = function(value)
  colorscheme = value
end

return M
