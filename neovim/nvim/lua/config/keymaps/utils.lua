local iswk, wk = pcall(require, "which-key")
local M = {}

M.desc = function(desc, icon)
  if not desc then
    return false
  elseif not iswk then
    return { desc = desc }
  else
    icon = icon or ""
    return { desc = desc, icon = icon }
  end
end

M.setKey = function(key, desc, fallback, opts)
  key = key or false
  fallback = fallback or false
  if not key or not fallback then
    return
  end

  opts = opts or {}
  opts.noremap = opts.noremap ~= false
  opts.silent = opts.silent or false
  opts.buffer = opts.buffer or false
  opts.desc = (desc and desc.desc) or nil
  opts.icon = (desc and desc.icon) or nil

  if not opts.desc or not iswk then
    return vim.keymap.set("n", key, fallback, opts)
  end

  wk.add({
    {
      key,
      fallback,
      desc = opts.desc,
      icon = opts.icon,
      noremap = opts.noremap,
      silent = opts.silent,
      buffer = opts.buffer,
    },
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
