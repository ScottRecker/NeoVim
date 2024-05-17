return {
  -- https://github.com/folke/todo-comments.nvim
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- TODO: what this then?
    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    -- FIX: This is some bullshit
    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    -- NOTE: what this then?
    todo_comments.setup()
    -- HACK: This looks wrong
    -- WARNING: ???
  end,
}
