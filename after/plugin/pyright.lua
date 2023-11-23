
--local on_attach = config.on_attach
--local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
    filetypes = { "python" },
})
