return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		-- local highlight = {
		-- 	-- "RainbowRed",
		-- 	-- "RainbowYellow",
		-- 	-- "RainbowBlue",
		-- 	"RainbowOrange",
		-- 	-- "RainbowGreen",
		-- 	-- "RainbowViolet",
		-- 	-- "RainbowCyan",
		-- }
		--
		-- local hooks = require("ibl.hooks")
		-- -- create the highlight groups in the highlight setup hook, so they are reset
		-- -- every time the colorscheme changes
		-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		-- 	-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#2E494D" })
		-- 	-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#2E394D" })
		-- 	-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4D392E" })
		-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#101010" })
		-- 	-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#292720" })
		-- 	-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#4D472E" })
		-- 	-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2E4D36" })
		-- end)
		--
		-- require("ibl").setup({
		-- 	scope = { enabled = false },
		-- 	indent = { highlight = highlight },
		-- })

		local highlight = {
			"CursorColumn",
			"Whitespace",
		}
		require("ibl").setup({
			indent = { highlight = highlight, char = "" },
			-- indent = { char = "▌" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		})

		-- require("ibl").setup({})
	end,
}
