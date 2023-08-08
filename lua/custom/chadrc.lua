---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  --Theme Config
  changed_themes = {
    onedark = {
      base_16 = {
        base00 = "#171825",
      },
    },
  },
  -- StatusLine Config
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  --DashBoard
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
