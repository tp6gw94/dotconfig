return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		cmd = "Telescope",
		version = false,
		opts = function()
			local actions = require("telescope.actions")
			return {
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
			}
		end,
		keys = {
			{ "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", "Find Files" },
			{ "<C-e>", "<cmd>Telescope buffers show_all_buffers=true<cr>", "Buffers" },
			{ "<leader>lg", "<cmd>Telescope live_grep<cr>", "Grep" },
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"echasnovski/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
		},
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"norcalli/nvim-colorizer.lua",
	},
	-- surround
	{
		"echasnovski/mini.surround",
		keys = { "gz" },
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
		config = function(_, opts)
			-- use gz mappings instead of s to prevent conflict with leap
			require("mini.surround").setup(opts)
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
			for _, ls in ipairs(language_servers) do
				require("lspconfig")[ls].setup({
					capabilities = capabilities,
					-- you can add other fields for setting up lsp server in this table
				})
			end
			require("ufo").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = { { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" } },
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			enable_git_status = true,
			enable_diagostics = true,
			window = {
				position = "left",
				width = 40,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = {
						".DS_Store",
					},
					follow_current_file = true,
					window = {
						mappings = {
							["H"] = "toggle_hidden",
						},
					},
				},
			},
		},
	},
	-- quick jump
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
		},
		config = function(_, opts)
			local leap = require("leap")
			leap.add_default_mappings(true)
		end,
	},
	-- outline
	{
		"simrat39/symbols-outline.nvim",
		events = "VeryLazy",
		opts = {
			auto_close = true,
		},
		keys = {
			{ "<leader>s", "<cmd>SymbolsOutline<cr>", desc = "Outline" },
		},
	},
}
