local M = {}

local leader = "SPC"
local if_nil = vim.F.if_nil

function M.bd26_button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl = "DashboardCenter",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

M.blankline = {
	indentLine_enabled = 1,
	buftype_exclude = {
		"terminal",
		"nofile",
		"quickfix",
		"prompt",
	},
	filetype_exclude = {
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"man",
		"dashboard",
		"git",
		"markdown",
		"text",
		"terminal",
		"NvimTree",
	},
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	show_current_context = true,
	show_current_context_start = true,
}

M.luasnip = function(opts)
	require("luasnip").config.set_config(opts)

	-- vscode format
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

	-- snipmate format
	require("luasnip.loaders.from_snipmate").load()
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	-- lua format
	require("luasnip.loaders.from_lua").load()
	require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})
end


M.notify = {
  timeout = 4000,
  padding = 2,
  max_width = 60,
  max_height = 17,
}


return M
