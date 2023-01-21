-- reference https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua
return {

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- auto completion
	{
		"tzachar/cmp-tabnine",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		build = "./install.sh",
		event = "InsertEnter",
		config = false,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"tzachar/cmp-tabnine",
		},
		opts = function()
			local cmp = require("cmp")
			local compare = cmp.config.compare
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
					["<tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Repace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Repace }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "cmp_tabnine" },
					{ name = "path" },
					{ name = "buffer", keyword_length = 4 },
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							cmp_tabnine = "[TabNine]",
							path = "[Path]",
							buffer = "[Buffer]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						compare.score,
						compare.locality,
						compare.recently_used,
						compare.offset,
					},
				},
				experimental = {
					ghost_text = {
						hl_group = "LspCodeLens",
					},
				},
			}
		end,
	},
	-- auto pair
	{
		"windwp/nvim-autopairs",
		opts = {},
	},
	-- auto close tag
	{
		"windwp/nvim-ts-autotag",
	},
	-- detect tab
	{
		"tpope/vim-sleuth",
	},
	-- comment
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
}
