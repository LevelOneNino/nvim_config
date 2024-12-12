return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "yavorski/lualine-macro-recording.nvim" },

	config = function()
		local battery = {
			function()
				return require("battery").get_status_line()
			end,
			color = { fg = "#00FF00", bg = "none" },
		}

		require("lualine").setup({
			options = {
				component_separators = { left = "  ", right = "  " },
			},

			sections = {
				lualine_a = { { "mode", color = { fg = "#00FF00", bg = "none" } } },
				lualine_b = {},
				lualine_c = {
					{ "location", color = { fg = "#FFb000", bg = "none" } },
					{ "filename", color = { fg = "#FFFFFF", bg = "none" }, path = 1 },
					{ "diagnostics", color = { bg = "none" } },
					{ "diff", color = { bg = "none" } },
				},
				lualine_z = {},
				lualine_y = {},
				lualine_x = { { "macro_recording", "%S" }, { "filetype", color = { fg = "#FFFFFF", bg = "none" } } },
			},
			tabline = {
				lualine_x = { { "datetime", color = { fg = "#00FFFF", bg = "none" } }, battery },
			},
		})
	end,
}
