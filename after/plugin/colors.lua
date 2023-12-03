--require('rose-pine').setup({
--    disable_background = true
--})
require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = false,
})

function ColorMyPencils(color)
	--color = color or "rose-pine"
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

    -- Not sure what these do
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
