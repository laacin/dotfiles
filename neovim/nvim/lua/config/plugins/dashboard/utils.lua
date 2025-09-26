local M = {}

local button = false

M.desc = function(icon, desc)
  local sep1 = button and button or ""
  local sep2 = button and " " or ""

  local v = icon .. "  " .. sep1 .. sep2 .. desc
  return v
end

M.oldfiles = function()
  local recent_files = {}

  for _, path in ipairs(vim.v.oldfiles) do
    if #recent_files >= 5 then
      break
    end
    if path:match("^/") and vim.fn.isdirectory(path) == 0 then
      table.insert(recent_files, {
        name = vim.fn.fnamemodify(path, ":t"),
        path = path,
      })
    end
  end

  return recent_files
end

return M
