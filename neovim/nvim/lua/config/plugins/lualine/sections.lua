local miniIcons = require("mini.icons")
local common = require("config.plugins.lualine.common")
local utils = require("config.plugins.lualine.utils")
local c = require("core.constants")
local M = {}

local icons = {
  diagnostics = { Error = " ", Warn = " ", Info = " ", Hint = " " },
  git = { added = " ", modified = " ", removed = " " },
}

-- -- MAIN
M.main = {
  lualine_a = { "mode" },
  lualine_b = { "branch" },
  lualine_c = {
    {
      function()
        return miniIcons.get("filetype", vim.bo.filetype) .. " "
      end,
      color = { fg = "#8aadf4" },
    },
    {
      function()
        return utils.get_file_name()
      end,
    },
    {
      "diagnostics",
      symbols = icons.diagnostics,
    },
  },

  lualine_x = {
    {
      function()
        return require("noice").api.status.command.get()
      end,
      color = { fg = "#ff9e64" },
    },
    {
      function()
        local mode = require("noice").api.status.mode.get()
        return vim.startswith(mode, "recording") and mode or ""
      end,
      color = { fg = "#a6d189" },
    },
    {
      "diff",
      symbols = icons.git,
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
    },
  },

  lualine_y = {
    { "progress", separator = " ", padding = { left = 1, right = 0 } },
    { "location", padding = { left = 0, right = 1 } },
  },

  lualine_z = common.time,
}

-- -- -- Oil
M.oil = {
  lualine_a = {
    "mode",
  },
  lualine_b = {
    "branch",
  },
  lualine_c = {
    {
      function()
        return " "
      end,
      color = { fg = "#8aadf4" },
    },
    {
      function()
        local path = utils.get_relative(true)
        if vim.startswith(path, "/") then
          return vim.fn.fnamemodify(path, ":~")
        else
          return c.PROJECT_NAME() .. "/" .. path
        end
      end,
    },
  },
  lualine_y = {
    {
      function()
        if utils.not_in_root(true) then
          return " Outside the project root: " .. c.PROJECT_NAME()
        end
        return c.PROJECT_NAME()
      end,
    },
  },
  lualine_z = common.time,
}

return M
