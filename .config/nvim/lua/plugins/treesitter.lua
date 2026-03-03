return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Install parsers for our languages
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local langs = { "rust", "typescript", "javascript", "go", "yaml", "toml", "json", "lua" }
        for _, lang in ipairs(langs) do
          pcall(function()
            require("nvim-treesitter.install").install(lang)
          end)
        end
      end,
      once = true,
    })

    -- Enable treesitter-based highlighting for all buffers
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
