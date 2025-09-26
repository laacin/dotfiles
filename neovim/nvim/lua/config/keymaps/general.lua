local m = require("config.keymaps.utils")
local oil = require("oil")

-- -- -- -- Generals
-- Oil
m.setKey("-", false, "<CMD>Oil<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "e", function()
      oil.select()
    end, { buffer = 0, noremap = true, silent = true })

    vim.keymap.set("n", "q", "<CMD>Oil<CR>", { buffer = 0, noremap = true, silent = true })
  end,
})

-- -- -- -- With <leader>
-- Open Lazy
m.setKey("<leader>l", m.desc("Lazy", "󰒲"), "<CMD>Lazy<CR>")

-- Toggle Neotree
m.setKey("<leader>e", m.desc("Toggle Neo-tree", "󰙅"), "<CMD>Neotree toggle<CR>")

-- Dashboard
m.setKey("<leader>h", m.desc("Dashboard", "󰋜"), "<CMD>Alpha<CR>")

-- wip
m.setKey("<leader>m", m.desc("workspace"), function()
  require("oil").open("/home/laacin/dotfiles/neovim/nvim/lua/config/plugins/dashboard")
end)
