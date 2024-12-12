return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", "assets" },
          sorting_strategy = "ascending",
          -- mappings = {
          --   n = {
          --     ["<C-d>"] = require("telescope.actions").delete_buffer
          --   }
          -- }
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-s>", builtin.buffers, {})
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>[", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>]", builtin.current_buffer_fuzzy_find, {})
    end,
  },
}
