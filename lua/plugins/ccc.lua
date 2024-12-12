return {
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
          preserve= true,
          save_on_quit = true,
				},
			})
			vim.keymap.set("n", "<leader>C", ":CccPick<CR>", {})
		end,
	},
}
