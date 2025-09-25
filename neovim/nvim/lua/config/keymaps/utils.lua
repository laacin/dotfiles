local iswk, wk = pcall(require, "which-key")
local M = {}

M.desc = function(desc, icon)
  desc = desc or false

  if not desc then
    return false
  elseif not iswk then
    return { desc = desc }
  else
    icon = icon or ""
    return { desc = desc, icon = icon }
  end
end

M.setKey = function(key, desc, fallback)
  key = key or false
  fallback = fallback or false
  if not key or not fallback then
    return
  end

  if not desc then
    return vim.keymap.set("n", key, fallback)
  elseif not iswk then
    return vim.keymap.set("n", key, fallback, desc.desc)
  end

  wk.add({
    { key, fallback, desc = desc.desc, icon = desc.icon },
  })
end

M.setGroup = function(key, desc)
  if not iswk then
    return
  end
  wk.add({
    { key, group = desc.desc, icon = desc.icon },
  })
end

return M
