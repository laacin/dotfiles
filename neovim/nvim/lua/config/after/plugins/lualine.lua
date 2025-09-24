local opts = function()
  local cwd = vim.fn.getcwd()
  local dir = vim.fn.fnamemodify(require("oil").get_current_dir(), ":.")
  local project = cwd:sub(#dir + 2):match("([^/]+)$")

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
              local path = vim.fn.fnamemodify(require("oil").get_current_dir(), ":.")
              return "  " .. " " .. project .. "/" .. path
            end,
          },
          lualine_y = {
            function()
              return project
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
