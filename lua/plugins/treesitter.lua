return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "html", "lua", "javascript", "dockerfile", "json", "yaml", "regex" },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "pug" }, -- List of languages to disable Treesitter highlighting for
      },
      indent = {
        enable = true,
        disable = { "pug" }, -- List of languages to disable Treesitter highlighting for
      },
    })
  end,
}
