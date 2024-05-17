return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
	},
	config = function()
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(path)
		-- Update the path passed to setup to point to your system or virtual env python binary
		-- require('dap-python').setup('.venv/bin/python')
		-- require('dap-python').setup('python')
		-- require('dap-python').setup()
	end,
}
