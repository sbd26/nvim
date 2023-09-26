local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end

-- Banner
local banner = {
  "          ▀████▀▄▄              ▄█ ",
  "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
  "    ▄        █          ▀▀▀▀▄  ▄▀  ",
  "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
  "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
  "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
  "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
  "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
  "   █   █  █      ▄▄           ▄▀   ",
  "                                   ",
}

dashboard.section.header.val = banner
dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.footer.opts.hl = "DashboardFooter"
local button = require("plugins.configs.others").bd26_button
-- Menu
dashboard.section.buttons.val = {
  button('Spc f f', '  Find File', ':Telescope find_files<CR>'),
  button('Spc f o', '󰈚  Recent file', ':Telescope oldfiles<CR>'),
  button('Spc f w', '󰈭  Find Word', ':Telescope live_grep<CR>'),
  button('Spc t h', '  Themes', ':Telescope themes<CR>'),
  button('Spc c h', '  Mapping', ':NvCheatsheet<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
