-- Set leader key
vim.g.mapleader = " "

-- Fix Oil infinite loop bug
if vim.bo.filetype == "oil" then
  return
end

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Column line
vim.opt.statuscolumn = "%s%=%{&number || &relativenumber ? (&relativenumber && v:relnum ? v:relnum : v:lnum) : ''}%=  "
vim.opt.fillchars = "eob: "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Wrap
vim.opt.wrap = false

-- History
vim.opt.shada = "!,'100,<50,s10,h"

-- square border on floats
vim.o.winborder = "single"
