local c = require("core.constants")
local set_cmd = vim.api.nvim_create_user_command

-- Toggle background
local bg = false
set_cmd("Background", function()
  bg = not bg

  if bg then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#030303" })
  else
    vim.cmd.colorscheme(c.COLORSCHEME())
  end
end, {})

-- Compile blink-cmp
set_cmd("BuildBlink", function()
  local path = c.DATA_PATH() .. "/lazy/blink.cmp"
  local cmd = { "cargo", "build", "--release" }

  vim.notify("🚀 Building blink.cmp...", vim.log.levels.INFO)

  vim.system(cmd, { cwd = path }, function(obj)
    if obj.code == 0 then
      vim.schedule(function()
        vim.notify("✅ Build completed successfully", vim.log.levels.INFO)
      end)
    else
      vim.schedule(function()
        vim.notify("❌ Build failed", vim.log.levels.ERROR)
        vim.cmd("new")
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(obj.stderr, "\n"))
      end)
    end
  end)
end, {})

-- Checkhealth vim.lsp
set_cmd("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, {})

-- Restart LSPs
---@diagnostic disable: missing-parameter
set_cmd("LspRestart", function()
  vim.lsp.stop_client(vim.lsp.get_clients(), true)
  vim.lsp.config("*", {
    root_dir = c.ROOT_DIR(),
  })
  vim.cmd("edit")
end, {})
