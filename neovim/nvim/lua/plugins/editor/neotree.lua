return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      width = 40,
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
    },
  },
}
