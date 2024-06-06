-- NOTE: this is not used. to remove
M = {}
M.on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local keymap = vim.keymap

	-- nmap("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
	-- nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
	-- nmap("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
	-- nmap("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
	-- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- nmap("gl", vim.diagnostic.open_float, "Open Diagnostic Float")

	-- nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")

	-- nmap("<leader>Wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
	-- nmap("<leader>Wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
	-- nmap("<leader>Wl", function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, "Workspace List Folders")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

	-- LSP
	-- keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP definition" })
	keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Goto declaration" })
	keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Goto implementation" })
	keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "LSP type definition" })
	keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
	keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature documentation" })
	keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })
	keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code action" })
	keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "LSP open diagnostic float" })
	keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "LSP goto prev" })
	keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "LSP goto next" })
	keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "LSP document symbol" })
	keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "LSP format" })
	keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "LSP completion" })

	-- local client = vim.lsp.get_client_by_id(event.data.client_id)
	-- if client and client.server_capabilities.documentHighlightProvider then
	--   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	--     buffer = event.buf,
	--     callback = vim.lsp.buf.document_highlight,
	--   })
	--
	--   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	--     buffer = event.buf,
	--     callback = vim.lsp.buf.clear_references,
	--   })
	-- end
end

return M
