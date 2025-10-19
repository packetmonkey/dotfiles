return {
	"nvim-lualine/lualine.nvim",
	name = "lualine",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		options = {
			theme = "tokyonight-night",
		},
    extensions = { "neo-tree", "lazy", "fzf", "avante" },
	},
}
