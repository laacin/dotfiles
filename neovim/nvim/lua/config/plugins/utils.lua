local c = require("core.constants")
local oil = require("oil")
local M = {}

M.oilcwd = oil.get_current_dir

M.relative_to = function(path, base)
  base = base:gsub("/$", "")
  if path:sub(1, #base) == base then
    local rel = path:sub(#base + 2)
    return rel
  else
    return path
  end
end

M.not_in_root = function(isoil)
  isoil = isoil or false

  if isoil then
    return not vim.startswith(M.oilcwd(), c.ROOT_DIR())
  else
    local buf = vim.api.nvim_buf_get_name(0)
    if buf == "" then
      return false
    end

    return not vim.startswith(buf, c.ROOT_DIR())
  end
end

M.get_relative = function(isoil)
  isoil = isoil or false
  local path = isoil and M.oilcwd() or vim.api.nvim_buf_get_name(0)

  return M.relative_to(path, c.ROOT_DIR())
end

M.get_file_name = function()
  local file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
  local relative = vim.fn.fnamemodify(file, ":.")
  return relative
end

return M
