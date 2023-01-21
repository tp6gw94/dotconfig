-- reference https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

return {
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		opts = {},
		keys = {
			{ "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "LSP Rename" },
			{ "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "LSP Code Action" },
			{ "gd", "<cmd>Lspsaga lsp_finder<cr>", desc = "LSP Finder" },
			{ "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "LSP Preview Definition" },
			{ "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "LSP Diagnostics" },
			{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "LSP Doc" },
			{ "<C-t>", "<cmd>Lspsaga term_toggle<cr>", desc = "Float Terminal" },
		},
	},
	-- lspconfig
	{
		"jose-elias-alvarez/typescript.nvim",
		cmd = {
			"TypescriptAddMissingImports",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"glepnir/lspsaga.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"b0o/SchemaStore.nvim",
		},
		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			},
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overriden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			---@type lspconfig.options
			servers = {
				jsonls = {
					on_new_config = function()
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = {
								enable = true,
							},
							validate = { enable = true },
						},
					},
				},
				sumneko_lua = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				tsserver = {},
			},
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require("utils").on_attach(function(client, buffer)
						if client.name == "tsserver" then
							vim.keymap.set(
								"n",
								"<leader>lto",
								"TypescriptOrganizeImports",
								{ buffer = buffer, desc = "Organize Imports" }
							)
							vim.keymap.set(
								"n",
								"<leader>ltr",
								"TypescriptRenameFile",
								{ desc = "Rename File", buffer = buffer }
							)
						end
					end)
					require("typescript").setup({
						disable_commands = false,
						server = opts,
						go_to_source_definition = { fallback = true },
					})
					return true
				end,
				-- Specify * to use this function as a fallback for any server
			},
		},
		---@param opts PluginLspOpts
		config = function(plugin, opts)
			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
			require("mason-lspconfig").setup_handlers({
				function(server)
					local server_opts = servers[server] or {}
					server_opts.capabilities = capabilities
					if opts.setup[server] then
						if opts.setup[server](server, server_opts) then
							return
						end
					elseif opts.setup["*"] then
						if opts.setup["*"](server, server_opts) then
							return
						end
					end
					require("lspconfig")[server].setup(server_opts)
				end,
			})
			require("typescript").setup({})
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/typescript.nvim" },
		event = "BufReadPre",
		opts = function()
			local nls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			return {
				sources = {
					nls.builtins.formatting.prettier.with({
						extra_args = { "--single-quote" },
						filetypes = {
							"javascript",
							"typescript",
							"typescriptreact",
							"graphql",
							"json",
							"typescriptreact",
							"javascriptreact",
						},
					}),
					nls.builtins.formatting.stylua,
					nls.builtins.diagnostics.flake8,
					require("typescript.extensions.null-ls.code-actions"),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									filter = function(c)
										return c.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			}
		end,
	},

	-- cmdline tools and lsp servers
	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>t", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagostics" },
			{ "<leader>T", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Document Diagostics" },
		},
	},
}
