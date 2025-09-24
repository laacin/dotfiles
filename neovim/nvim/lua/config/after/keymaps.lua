-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- LSP logs
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float(nil, { border = "single" })
end, { noremap = true, silent = true, desc = "LSP logs" })

vim.keymap.set("n", "<leader>dE", function()
  vim.diagnostic.setloclist({ open = true, border = "single" })
end, { noremap = true, silent = true, desc = "LSP logs (ALL)" })

-- Home menu
vim.keymap.set("n", "<leader>h", function()
  require("snacks.dashboard").open()
end, { noremap = true, silent = true, desc = "Home menu" })
