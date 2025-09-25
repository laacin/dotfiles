local c = require("core.constants")

local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- ColorScheme
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("colorscheme_augroup"),
  callback = function()
    -- Cursorline
    vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#D7AF5F" })
    vim.api.nvim_set_hl(0, "CursorLine", { underline = false })

    -- Disable float tabs background
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- Displays a warning when leaving the root directory
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("root_dir_warn"),
  callback = function()
    if vim.bo.filetype == "oil" then
      return
    end

    local buf_path = vim.api.nvim_buf_get_name(0)
    if buf_path == "" then
      return
    end

    if not vim.startswith(buf_path, c.ROOT_DIR()) then
      vim.notify("Out of Root directory", "warn")
    end
  end,
})
