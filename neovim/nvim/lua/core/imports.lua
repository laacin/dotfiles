local config = require("core.constants").CONFIG_PATH() .. "/lua/"

local M = {}

M.read_files = function(dir, as_mod)
  as_mod = as_mod or false
  local path = config .. dir

  local files = {}

  local fn
  fn = function(route)
    for name, type in vim.fs.dir(route) do
      local abspath = route .. "/" .. name
      if type == "file" then
        table.insert(files, abspath)
      elseif type == "directory" then
        fn(abspath)
      end
    end
  end

  fn(path)

  if not as_mod then
    return files
  end

  local mods = {}
  for _, f in ipairs(files) do
    local rel = f:sub(#config + 1)
    local noext = rel:gsub("%.%w+$", "")
    local mod = noext:gsub("/", ".")

    table.insert(mods, mod)
  end

  return mods
end

M.read_dirs = function(basedir, as_mod)
  as_mod = as_mod or false
  local absp = config .. basedir
  local dirs = {}

  local fn
  fn = function(path)
    for name, type in vim.fs.dir(path) do
      if type == "directory" then
        local abspath = path .. "/" .. name
        table.insert(dirs, abspath)
        fn(abspath)
      end
    end
  end

  fn(absp)
  if not as_mod then
    return dirs
  end

  local mods = {}
  for _, f in ipairs(dirs) do
    local rel = f:sub(#config + 1)
    local noext = rel:gsub("%.%w+$", "")
    local mod = noext:gsub("/", ".")

    table.insert(mods, mod)
  end

  return mods
end

M.load = function(mods)
  for _, mod in ipairs(mods) do
    require(mod)
  end
end

M.flatten = function(tbls)
  local result = {}

  local fn
  fn = function(value)
    for _, v in pairs(value) do
      if type(v) == "string" then
        table.insert(result, v)
      elseif type(v) == "table" then
        fn(v)
      end
    end
  end

  fn(tbls)
  return result
end

return M
