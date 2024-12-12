return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-q>", ":Telescope file_browser<CR>", {})
		require("telescope").setup({
			extensions = {
				file_browser = {
					path = "%:p:h",
					grouped = true,
					hijack_netrw = true,
					initial_mode = "normal",
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
