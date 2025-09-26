local ascii = require("config.plugins.dashboard.ascii")
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = ascii.a

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

for _, btn in ipairs(dashboard.section.buttons.val) do
  btn.opts.hl = "Keyword"
  btn.opts.hl_shortcut = "Identifier"
end
dashboard.section.buttons.opts.spacing = 1

dashboard.section.footer.val = function()
  return os.date(" %A, %d %B %Y   %H:%M")
end
dashboard.section.footer.opts.hl = "Comment"

dashboard.config.layout = {
  { type = "padding", val = 2 },
  dashboard.section.header,
  { type = "padding", val = 1 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}

dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.config)
