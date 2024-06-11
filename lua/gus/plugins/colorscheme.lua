return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = false,
			})
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin" },
}
