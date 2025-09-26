local M = {}

M.time = {
  function()
    return " " .. os.date("%R")
  end,
}

return M
