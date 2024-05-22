return {
	-- https://github.com/NeogitOrg/neogit
	"TimUntersberger/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		-- "ibhagwan/fzf-lua",              -- optional
	},
	cmd = "Neogit",
	config = function()
		require("neogit").setup({
			kind = "split", -- opens neogit in a split
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			integrations = { diffview = true }, -- adds integration with diffview.nvim
		})
	end,
}
