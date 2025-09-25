local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("fail load npairs")
else
  npairs.setup({
    check_ts = true,
  })
end
