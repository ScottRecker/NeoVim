return {
	-- https://github.com/j-hui/fidget.nvim
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	config = function()
		local fidget = require("fidget")
		fidget.setup({
			progress = {
				-- Options related to Neovim's built-in LSP client
				lsp = {
					progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
					log_handler = false, -- Log `$/progress` handler invocations (for debugging)
				},
			},
			notification = {
				window = {
					normal_hl = "String", -- Base highlight group in the notification window
					winblend = 0, -- Background color opacity in the notification window
					border = "rounded", -- Border around the notification window
					zindex = 45, -- Stacking priority of the notification window
					max_width = 0, -- Maximum width of the notification window
					max_height = 0, -- Maximum height of the notification window
					x_padding = 1, -- Padding from right edge of window boundary
					y_padding = 1, -- Padding from bottom edge of window boundary
					align = "bottom", -- How to align the notification window
					relative = "editor", -- What the notification window position is relative to
				},
			},
			-- Options related to integrating with other plugins
			integration = {
				["nvim-tree"] = {
					enable = true,
				},
				["xcodebuild-nvim"] = {
					enable = true,
				},
			},
		})
	end,
}
