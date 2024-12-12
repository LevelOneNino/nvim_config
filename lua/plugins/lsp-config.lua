return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          "lua_ls",
          "stylua",
          "prettierd",
          "ts_ls",
          "solc",
          "pyright",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
    config = function()

      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          require("nvim-lsp-ts-utils").setup({
            filter_out_diagnostics_by_code = { 80001 },
          })
          require("nvim-lsp-ts-utils").setup_client(client)
        end,
      })
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },

    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({

        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettierd.with({ args = { "--prose-wrap never" } }),
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
