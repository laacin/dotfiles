local c = require("core.constants")

local function relative_to(path, base)
  base = base:gsub("/$", "")
  if path:sub(1, #base) == base then
    local rel = path:sub(#base + 2)
    return rel
  else
    return path
  end
end

local opts = function()
  local oilcwd = require("oil").get_current_dir

  local is_out = function(isoil)
    isoil = isoil or false

    if isoil then
      return not vim.startswith(oilcwd(), c.ROOT_DIR())
    else
      local buf = vim.api.nvim_buf_get_name(0)
      if buf == "" then
        return false
      end

      return not vim.startswith(buf, c.ROOT_DIR())
    end
  end

  local icons = {
    diagnostics = { Error = " ", Warn = " ", Info = " ", Hint = " " },
    git = { added = " ", modified = " ", removed = " " },
  }

  local opts = {
    options = {
      theme = "catppuccin-mocha",
      globalstatus = true,
      disabled_filetypes = { statusline = { "snacks_dashboard" } },
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        function()
          local file = vim.api.nvim_buf_get_name(0)
          local relative = vim.fn.fnamemodify(file, ":.")
          return relative
        end,
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
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
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
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
    extensions = {
      "neo-tree",
      "lazy",
      "fzf",
      {
        filetypes = { "oil" },
        sections = {
          lualine_a = {
            "mode",
          },
          lualine_b = {
            "branch",
          },
          lualine_c = {
            function()
              local prefix = "  " .. " "
              local path = relative_to(oilcwd(), c.ROOT_DIR())

              if vim.startswith(path, "/") then
                return prefix .. vim.fn.fnamemodify(path, ":~")
              else
                return prefix .. c.PROJECT_NAME() .. "/" .. path
              end
            end,
          },
          lualine_y = {
            function()
              if is_out(true) then
                return " Outside the project root: " .. c.PROJECT_NAME()
              end
              return c.PROJECT_NAME()
            end,
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
      },
    },
  }

  return opts
end

require("lualine").setup(opts())
