-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },

		-- Auto-Install LSPs, linters, formatters, debuggers
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{
			"j-hui/fidget.nvim",
			opts = {},
		},

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim" },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- Install these LSPs automatically
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"jsonls",
				"lemminx",
				"marksman",
				"quick_lint_js",
				"yamlls",
				"pyright",
				"rust_analyzer",
			},
		})

		require("mason-tool-installer").setup({
			-- Install these linters, formatters, debuggers automatically
			ensure_installed = {
				"black",
				"debugpy",
				"flake8",
				"ruff",
				"pylint",
				"eslint_d",
			},
		})

		-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
		vim.api.nvim_command("MasonToolsInstall")

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_attach,
					capabilities = lsp_capabilities,
				})
			end,
		})

		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			capabilities = lsp_capabilities,
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
			settings = {
				["rust_analyzer"] = {
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})

		-- Python virtual env detection
		local util = require("lspconfig/util")
		local path = util.path

		-- Python LSP settings
		lspconfig.pyright.setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			filetypes = { "python" },
			before_init = function(_, config)
				local default_venv_path = path.join(vim.env.HOME, ".venv", "bin", "python")
				config.settings.python.pythonPath = default_venv_path
			end,
			settings = {
				pyright = {
					disableOrganizeImports = true, -- Using Ruff
				},
				python = {
					analysis = {
						ignore = { "*" }, -- Using Ruff
					},
				},
			},
		})

		local on_attach = function(client, _)
			if client.name == "ruff" then
				-- Disable hover in favor of pyright
				client.server_capabilities.hoverProvider = false
			end
		end

		require("lspconfig").ruff.setup({
			on_attach = on_attach,
		})

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
