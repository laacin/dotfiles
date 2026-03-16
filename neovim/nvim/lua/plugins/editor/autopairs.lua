-- temporal fix
local function cfg(_, opts)
  require("nvim-autopairs").setup(opts)

  vim.keymap.set("i", "<CR>", function()
    local col = vim.fn.col(".")
    local line = vim.fn.getline(".")
    local prev = line:sub(col - 1, col - 1)
    local next = line:sub(col, col)

    local pairs = { ["("] = ")", ["{"] = "}", ["["] = "]", ['"'] = '"', ["'"] = "'" }

    if pairs[prev] == next then
      return "\n<Esc>O"
    end

    return "\n"
  end, { expr = true })
end

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { map_cr = false },
    config = cfg,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        html = { enable_close = false },
      },
    },
  },
}
