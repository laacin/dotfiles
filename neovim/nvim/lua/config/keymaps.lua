-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- LSP logs
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float(nil, { border = "rounded" })
end, { noremap = true, silent = true, desc = "LSP logs" })
