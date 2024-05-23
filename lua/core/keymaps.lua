-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>,", ":nohl<CR>", { desc = "Clear search highlights" })

-- Yank to clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode with jk" })
keymap.set("i", "jj", "<ESC>", { desc = "exit insert mode with jj" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "save and quit" })
keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "quit without saving" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "save" })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "open URL under cursor" })

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split window" })
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "make split window height shorter" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "make split windows height taller" })
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "make split windows width bigger" })
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "make split windows width smaller" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open a new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close a tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", { desc = "put diff from current to other during diff" })
keymap.set("n", "<leader>cj", ":diffget 1<CR>", { desc = "get diff from left (local) during merge" })
keymap.set("n", "<leader>ck", ":diffget 3<CR>", { desc = "get diff from right (remote) during merge" })
keymap.set("n", "<leader>cn", "]c", { desc = "next diff hunk" })
keymap.set("n", "<leader>cp", "[c", { desc = "previous diff hunk" })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "open quickfix list" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "jump to first quickfix list item" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "jump to next quickfix list item" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "jump to prev quickfix list item" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "jump to last quickfix list item" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "close quickfix list" })

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle maximize tab" })

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "toggle file explorer" })
keymap.set("n", "<leader>eo", ":NvimTreeFocus<CR>", { desc = "toggle focus to file explorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "find file in file explorer" })
keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "collapse all open folders" })
keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "refresh the file explorer" })

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, {})
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, {})
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fm", function()
  require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end, { desc = "Trouble toggle" })
vim.keymap.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble toggle" })
vim.keymap.set("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble toggle" })
vim.keymap.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end, { desc = "Trouble toggle" })
vim.keymap.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end, { desc = "Trouble toggle" })
vim.keymap.set("n", "gR", function()
  require("trouble").toggle("lsp_references")
end, { desc = "Trouble toggle" })
keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Open todos in Trouble" })

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "toggle git blame" })

-- Harpoon
-- keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
-- keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
-- keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
-- keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
-- keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
-- keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
-- keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
-- keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
-- keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
-- keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
-- keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP definition" })
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP declaration" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP implementation" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "LSP type definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })
keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "LSP format" })
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code action" })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "LSP open float" })
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "LSP goto prev" })
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "LSP goto next" })
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "LSP document symbol" })
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "LSP completion" })

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", "<leader>go", function()
  if vim.bo.filetype == "python" then
    vim.api.nvim_command("PyrightOrganizeImports")
  end
end, { desc = "Organize imports" })

keymap.set("n", "<leader>tc", function()
  if vim.bo.filetype == "python" then
    require("dap-python").test_class()
  end
end, { desc = "Test class" })

keymap.set("n", "<leader>tm", function()
  if vim.bo.filetype == "python" then
    require("dap-python").test_method()
  end
end, { desc = "Test method" })

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Dap toggle breakpoint" })
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Dap breakpoint condition" })
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Dap breakpoint message" })
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Dap clear breakpoints" })
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "Dap list breakpoints" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Dap continue" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Dap step over" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Dap step into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Dap step out" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Dap REPL toggle" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Dap run last" })
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "Telescope dap frames" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "Telescope dap commands" })

keymap.set("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end, { desc = "Dap disconnect" })

keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end, { desc = "Dap terminate and close" })

keymap.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end, { desc = "Dap hover" })

keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "Dap widgets" })

keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "Telescope diagnostics" })
