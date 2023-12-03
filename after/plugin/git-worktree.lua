local Worktree = require("git-worktree")
local Job = require("plenary.job")

local function is_nrdp()
    return not not (string.find(vim.loop.cwd(), vim.env.NRDP, 1, true))
end

Worktree.on_tree_change(function(op, path, upstream)
    if op == "create" and is_nrdp() then
        Job:new({
            "git", "submodule", "update"
        }):start()
    end
end)
