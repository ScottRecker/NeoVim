-- Fuzzy finder
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  "nvim-telescope/telescope.nvim",
  lazy = true,
  branch = "0.1.x",
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { "nvim-lua/plenary.nvim", "folke/todo-comments.nvim" },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75,
        },
      },
    },
  },

  config = function()
    print("Loading noice extenion")
    require("telescope").load_extension("noice")
  end,
}
