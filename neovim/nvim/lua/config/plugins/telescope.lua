require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "%.git/" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    mappings = {
      i = { ["<C-h>"] = "which_key" },
    },
  },
  pickers = {
    find_files = {},
  },
})
