-- Set leader key
vim.g.mapleader = " "

-- Fix Oil infinite loop bug
if vim.bo.filetype == "oil" then
  return
end

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Column line
vim.opt.fillchars = "eob: "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%=%l "

-- Wrap
vim.opt.wrap = false
