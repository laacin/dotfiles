return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  requires = { "nvim-tree/nvim-web-devicons", opt = true },
  opts = {
    options = {
      theme = "catppuccin",
      icons_enabled = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
        },
      },
    },
    extensions = {
      "quickfix",
      {
        filetypes = { "oil" },
        sections = {
          lualine_a = {
            "mode",
          },
          lualine_b = {
            function()
              local ok, oil = pcall(require, "oil")
              if not ok then
                return ""
              end

              local path = vim.fn.fnamemodify(oil.get_current_dir(), ":~")
              return path .. " %m"
            end,
          },
        },
      },
    },
  },
}
