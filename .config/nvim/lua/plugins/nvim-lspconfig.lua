return {
	"neovim/nvim-lspconfig",

	-- dependencies = {
	-- },

	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,

	config = function()
		-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("lspconfig").bashls.setup({})
		require("lspconfig").ansiblels.setup({})
		require("lspconfig").gleam.setup({})
		require("lspconfig").yamlls.setup({})
		require("lspconfig").openscad_lsp.setup({})

		require("lspconfig").ruby_lsp.setup({
			cmd = { "ruby-lsp" },
		})

		require("lspconfig").lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local buffnr = args.buf
				local opts = { buffer = buffnr, remap = false }

				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if client then
					if client.supports_method("textDocument/completion") then
						vim.bo[buffnr].omnifunc = "v:lua.vim.lsp.omnifunc"
					end

					if client.supports_method("textDocument/definition") then
						vim.keymap.set("n", "gd", function()
							vim.lsp.buf.definition()
						end, opts)
						vim.bo[buffnr].tagfunc = "v:lua.vim.lsp.tagfunc"
					end

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float({ border = "rounded" })
					end, opts)
					vim.keymap.set("n", "<leader>i", function()
						vim.lsp.buf.format({ async = false })
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end
			end,
		})
	end,
}
