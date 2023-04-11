require("onedark").setup {
	transparent = true,
	ending_tildes = true,
	lualine = {
		transparent = true,
	},
}
require("onedark").load()
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

