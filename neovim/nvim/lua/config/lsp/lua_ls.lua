local c = require("core.constants")

local ws = function(wkspc)
  wkspc = wkspc or false

  if wkspc == "complete" then
    return vim.api.nvim_get_runtime_file("", true)
  else
    return c.ROOT_DIR()
  end
end

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = ws("complete") },
      telemetry = { enable = false },
    },
  },
})
