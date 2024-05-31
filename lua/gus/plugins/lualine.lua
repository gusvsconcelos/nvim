return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_tokyonight = require("lualine.themes.tokyonight")

		custom_tokyonight.normal.a.gui = "bold"
		custom_tokyonight.insert.a.gui = "bold"
		custom_tokyonight.visual.a.gui = "bold"
		custom_tokyonight.replace.a.gui = "bold"
		custom_tokyonight.command.a.gui = "bold"

		custom_tokyonight.normal.c.bg = "#16161E00"
		custom_tokyonight.inactive.a.bg = "#16161E00"
		custom_tokyonight.inactive.b.bg = "#16161E00"
		custom_tokyonight.inactive.c.bg = "#16161E00"

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = custom_tokyonight,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
