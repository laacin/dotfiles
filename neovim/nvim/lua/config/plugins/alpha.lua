local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

-- Buttons con iconos unicode
dashboard.section.buttons.val = {
  dashboard.button("e", " New file", ":ene <CR>"),
  dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
  dashboard.button("q", " Quit NVIM", ":qa<CR>"),
  dashboard.button("l", "󰒲 Lazy", ":Lazy<CR>"),
}

-- Footer fijo
dashboard.section.footer.val = "Welcome to Neovim!"

-- Layout settings
dashboard.config.opts.noautocmd = true

-- Setup alpha
alpha.setup(dashboard.config)

-- Optional: autocmd when ready
vim.cmd([[autocmd User AlphaReady echo 'Alpha ready!']])
