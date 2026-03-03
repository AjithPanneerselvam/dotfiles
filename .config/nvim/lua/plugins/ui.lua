return {
  -- Gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,  -- Load before other plugins
    config = function()
      require("gruvbox").setup({
        contrast = "medium",
        overrides = {
          SignColumn = { bg = "none" },  -- Blend sign column with background
        },
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Status line (like airline but faster)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          section_separators = "",
          component_separators = "|",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics" },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
