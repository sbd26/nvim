require("core")
local fn = vim.fn

require("core.utils").load_mappings()

local function shell_call(args)
	local output = fn.system(args)
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end
--Install Lazy.nvim if not found for the first time only

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then

	local lazy_path = fn.stdpath("data") .. "/lazy/base46"
	local base46_repo = "https://github.com/sbd26/base46"
	shell_call({ "git", "clone", "--depth", "1", "-b", "new", base46_repo, lazy_path })
	vim.opt.rtp:prepend(lazy_path)

	require("base46").compile()
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

dofile(vim.g.base46_cache .. "defaults")
require("plugins")
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

vim.lsp.inlay_hint(1, true)
-- dofile(vim.g.base46_cache .. "treesitter")
