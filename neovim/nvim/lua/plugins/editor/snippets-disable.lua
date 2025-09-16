local blink = require("blink-cmp")

local blink_config = {
  sources = {
    providers = {
      lsp = { score_offset = 10 },
      buffer = { score_offset = 5 },
      path = { score_offset = 0 },
      snippets = {
        opts = {
          friendly_snippets = false,
        },
      },
    },
  },
}

blink.setup(blink_config)

return {}
