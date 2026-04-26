return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib" },
  build = function()
    -- build the fuzzy matcher, wait up to 60 seconds
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require("blink.cmp").build():wait(60000)
  end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = "enter" },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { default = { "lsp", "path", "snippets", "buffer" } },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "lua" },
  },
}

-- return {
--   "saghen/blink.cmp",
--   opts_extend = { "sources.default" },
--   completions = {
--     accept = {
--       auto_brackets = false,
--     },
--     ghost_text = { enabled = false },
--     menu = { border = "single" },
--   },
--   signature = { window = { border = "single" } },
--
--   opts = {
--     completion = {
--       documentation = {
--         auto_show = true,
--         window = { border = "single" },
--       },
--     },
--     cmdline = {
--       enabled = true,
--       keymap = { preset = "cmdline" },
--       completion = {
--         list = { selection = { preselect = false } },
--         menu = {
--           auto_show = function()
--             return vim.fn.getcmdtype() == ":"
--           end,
--         },
--         ghost_text = { enabled = true },
--       },
--     },
--
--     keymap = {
--       preset = "enter",
--       ["<C-y>"] = { "select_and_accept" },
--     },
--
--     sources = {
--       providers = {
--         lsp = { score_offset = 10 },
--         buffer = { score_offset = 5 },
--         path = { score_offset = 0 },
--         snippets = {
--           opts = {
--             friendly_snippets = false,
--           },
--         },
--       },
--     },
--
--     appearance = {
--       nerd_font_variant = "normal",
--       kind_icons = {
--         Text = "",
--         Method = "󰊕",
--         Function = "󰊕",
--         Constructor = "",
--         Field = "󰇽",
--         Variable = "󰂡",
--         Class = "󰜁",
--         Interface = "",
--         Module = "",
--         Property = "󰜢",
--         Unit = "",
--         Value = "󰎠",
--         Enum = "",
--         Keyword = "󰌋",
--         Snippet = "󰒕",
--         Color = "󰏘",
--         Reference = "",
--         File = "",
--         Folder = "󰉋",
--         EnumMember = "",
--         Constant = "󰏿",
--         Struct = "",
--         Event = "",
--         Operator = "󰆕",
--         TypeParameter = "󰅲",
--       },
--     },
--   },
--
--   fuzzy = {
--     implementation = "prefer_rust_with_warning",
--     sorts = {
--       function(a, b)
--         local order = {
--           Field = 1,
--           Property = 2,
--           Method = 3,
--         }
--         local ka = order[a.kind] or 99
--         local kb = order[b.kind] or 99
--         return ka < kb
--       end,
--       "score",
--       "sort_text",
--     },
--   },
-- }
