local M = {}

M.ui = {
	------------------------------- base46 -------------------------------------
	-- hl = highlights
	hl_add = {},
	hl_override = {},
	changed_themes = {},
	theme_toggle = { "onedark", "onedark" },
	theme = "onedark", -- default theme transparency = false, lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

	-- cmp themeing
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "colored", -- colored / simple
	},

	telescope = { style = "borderless" }, -- borderless / bordered

	statusline = {
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		separator_style = "round",
		overriden_modules = nil,
	},



  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

	------------------------------- nvchad_ui modules -----------------------------

	cheatsheet = { theme = "grid" }, -- simple/grid

	lsp = {
		-- show function signatures i.e args as you type
		signature = {
			disabled = false,
			silent = true, -- silences 'no signature help available' message from appearing
		},
	},
}

M.plugins = "" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require("plugins.configs.lazy_nvim") -- config for lazy.nvim startup options

M.mappings = require("core.mappings")

return M
