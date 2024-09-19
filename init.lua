-- This has to be set before initializing lazy
vim.g.mapleader = " "

require("config.lazy")

-- These modules are not loaded by lazy
require("core.options")
require("core.keymaps")
