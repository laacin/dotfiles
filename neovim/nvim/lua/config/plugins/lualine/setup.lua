local sections = require("config.plugins.lualine.sections")

require("lualine").setup({
  options = {
    globalstatus = true,
    disabled_filetypes = {
      statusline = { "alpha" },
    },
  },

  sections = sections.main,
  extensions = {
    {
      filetypes = { "oil" },
      sections = sections.oil,
    },
    "neo-tree",
    "lazy",
    "fzf",
  },
})
