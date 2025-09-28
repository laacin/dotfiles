local ascii = require("config.plugins.dashboard.ascii")
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local m = require("config.plugins.dashboard.utils")

dashboard.section.header.val = ascii.a
dashboard.section.buttons.val = {
  dashboard.button("r", m.desc("", "Start"), ":Oil<CR>"),
  dashboard.button("f", m.desc("", "Find file"), ":Telescope find_files<CR>"),
  dashboard.button("l", m.desc("󰒲", "Lazy"), ":Lazy<CR>"),
  dashboard.button("c", m.desc("", "Configuration"), ":Config<CR>"),
  dashboard.button("q", m.desc("", "Quit"), ":qa<CR>"),
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
  { type = "padding", val = 4 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}

dashboard.config.opts.noautocmd = true
alpha.setup(dashboard.config)

-- local function get_recent_files(max)
--   local recent = {}
--   for _, path in ipairs(vim.v.oldfiles) do
--     if vim.fn.filereadable(path) == 1 and #recent < (max or 5) then
--       if vim.startswith(path, "/") then
--         table.insert(recent, path)
--       end
--     end
--   end
--   return recent
-- end
--
-- vim.defer_fn(function()
--   local files = get_recent_files(5)
--   print(vim.inspect(files))
-- end, 200)
