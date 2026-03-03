return {
  -- Mason: portable package manager for LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "ts_ls",
          "gopls",
          "yamlls",
        },
        automatic_enable = false,  -- We'll configure LSPs manually below
      })
    end,
  },

  -- LSP configuration (using Neovim 0.11+ native API)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Configure each LSP using vim.lsp.config (new 0.11 API)
      vim.lsp.config.rust_analyzer = {}
      vim.lsp.config.ts_ls = {}
      vim.lsp.config.gopls = {}
      vim.lsp.config.yamlls = {}

      -- Enable the configured LSPs
      vim.lsp.enable({ "rust_analyzer", "ts_ls", "gopls", "yamlls" })
    end,
  },
}
