return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      --ensure_installed = {"lua", "javascrpt"},
      ensure_installed = {"lua"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
