return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,  -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "minimal",
        hi = {
          background = "none",
        },
        options = {
          break_line = {
            enabled = true,
            after = 30,
          },
          -- multilines = true,
        },
      })
    end,
  },
}
