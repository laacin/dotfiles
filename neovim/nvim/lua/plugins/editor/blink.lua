return {
  "saghen/blink.cmp",
  opts_extend = { "sources.default" },
  completions = {
    accept = {
      auto_brackets = false,
    },
    ghost_text = { enabled = false },
    menu = { border = "single" },
  },
  signature = { window = { border = "single" } },

  opts = {
    completion = {
      documentation = {
        auto_show = true,
        window = { border = "single" },
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
      completion = {
        list = { selection = { preselect = false } },
        menu = {
          auto_show = function()
            return vim.fn.getcmdtype() == ":"
          end,
        },
        ghost_text = { enabled = true },
      },
    },

    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },

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

    appearance = {
      nerd_font_variant = "normal",
      kind_icons = {
        Text = "",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰜁",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "󰒕",
        Color = "󰏘",
        Reference = "",
        File = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      },
    },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
    sorts = {
      function(a, b)
        local order = {
          Field = 1,
          Property = 2,
          Method = 3,
        }
        local ka = order[a.kind] or 99
        local kb = order[b.kind] or 99
        return ka < kb
      end,
      "score",
      "sort_text",
    },
  },
}
