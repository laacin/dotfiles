local pkg = require("core.ensure_installed").mason
local registery = require("mason-registry")

local contains = function(tbl, val)
  for _, v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end

for _, p in pairs(registery.get_installed_packages()) do
  if not contains(pkg, p.name) then
    p:uninstall()
  end
end

for _, p in pairs(pkg) do
  local ok, mason_pkg = pcall(registery.get_package, p)
  if not ok or not mason_pkg then
    vim.notify("Mason package not found: " .. p, vim.log.levels.WARN)
  elseif not mason_pkg:is_installed() then
    pcall(function()
      mason_pkg:install()
    end)
  end
end
