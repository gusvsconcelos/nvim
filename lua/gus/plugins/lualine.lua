return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						path = 0,
						symbols = { modified = "●", readonly = "󰷊", unnamed = "󰇘", newfile = "󱪝" },
					},
				},
				lualine_x = { "filetype", { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_y = { "location", "progress" },
				lualine_z = { { 'os.date("%H:%M")', icon = "" } },
			},
			inactive_sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						path = 0,
						symbols = { modified = "●", readonly = "󰷊", unnamed = "󰇘", newfile = "󱪝" },
					},
				},
				lualine_x = { "filetype", { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_y = { "location", "progress" },
				lualine_z = { { 'os.date("%H:%M")', icon = "" } },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
