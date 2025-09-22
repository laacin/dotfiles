local install = require("utils.unpacking")(require("ensure_installed").mason)

local registry = require("mason-registry")

for _, name in ipairs(registry.get_installed_package_names()) do
  if not vim.tbl_contains(install, name) then
    local ok, pkg = pcall(registry.get_package, name)
    if ok and registry.is_installed(pkg.name) then
      pkg:uninstall()
    end
  end
end

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = install,
    ui = {
      border = "single",
    },
  },
}
