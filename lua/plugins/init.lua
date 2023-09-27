local plugins = {
	"nvim-lua/plenary.nvim",
	--Base Things for themeing
	{
		"sbd26/base46",
		event = "VeryLazy",
		branch = "new",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"sbd26/ui",
		branch = "new",
		lazy = false,
	},

	{
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		-- lazy = true,
		config = function()
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup()
		end,
	},

	-- bufferline and alpha-nvim

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			require("core.utils").load_mappings("nvimtree")
		end,
		opts = function()
			return require("plugins.configs.nvimtree")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "nvimtree")
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		init = function()
			require("core.utils").load_mappings("bufferline")
		end,
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				options = {
					show_tab_indicators = true,
				},
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			dofile(vim.g.base46_cache .. "alpha")
			require("plugins.configs.alpha")
		end,
	},

	--Treesitter and indent blankline
	{
		"nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
		-- init = function()
			-- require("core.utils").lazy_load("nvim-treesitter")
		-- end,
		build = ":TSUpdate",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		config = function()
			dofile(vim.g.base46_cache .. "syntax")
			require("plugins.configs.treesitter")
		end,

		dependencies = {
			{
				"lukas-reineke/indent-blankline.nvim",
				event = "VeryLazy",
				opts = function()
					dofile(vim.g.base46_cache .. "blankline")
					return require("plugins.configs.others").blankline
				end,

				config = function(_, opts)
					require("indent_blankline").setup(opts)
				end,
			},
		},
	},

	--telescope

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		opts = function()
			return require("plugins.configs.telescope")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "telescope")
			local telescope = require("telescope")
			require("telescope").setup(opts)

			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
	--LSP STUFF
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = function()
			return require("plugins.configs.mason")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "mason")
			require("mason").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			dofile(vim.g.base46_cache .. "lsp")
			require("plugins.configs.lspconfig")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("plugins.configs.others").luasnip(opts)
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("plugins.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	--EXTRA THINGS
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		init = function()
			require("core.utils").lazy_load("nvim-colorizer.lua")
		end,
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		init = function()
			require("core.utils").load_mappings("comment")
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.others").notify
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "notify")
			vim.notify = require("notify")
			vim.notify.setup(opts)
		end,
	},

	{
		"xeluxee/competitest.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		init = function()
			require("core.utils").load_mappings("competitive")
		end,
		config = function()
			require("plugins.configs.competitve")
		end,
		cmd = {
			"CompetiTestAdd",
			"CompetiTestReceive",
			"CompetiTestRun",
		},
	},

	-- Debugger Setup for c and c++
	{
		"mfussenegger/nvim-dap",
		cmd = "DapContinue",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				event = "VeryLazy",
				opts = {
					handlers = {},
				},
			},

			{
				"rcarriga/nvim-dap-ui",
				event = "VeryLazy",
				dependencies = "mfussenegger/nvim-dap",
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup()
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
		},
	},
}

local lazy_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_config)
