require("telescope").setup({
  defaults = {
    -- ejemplo simple usando icons
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    mappings = {
      i = { ["<C-h>"] = "which_key" },
    },
  },
  pickers = {
    find_files = {
      attach_mappings = function(_, map)
        local transform = function(entry)
          local icon = icons.get_icon(entry.value) -- devuelve un icono según extensión
          return icon .. " " .. entry.value
        end
        -- normalmente usarías `entry_display` para cambiar cómo se muestra
        return true
      end,
    },
  },
})
