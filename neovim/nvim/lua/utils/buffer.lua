local mod = {}

function mod.is_this_ext(expect)
  local bufname = vim.api.nvim_buf_get_name(0)
  return bufname:match("%." .. expect .. "$") ~= nil
end

function mod.get_ext()
  local bufname = vim.api.nvim_buf_get_name(0)
  return bufname:match("%.([%w]+)$")
end

return mod
