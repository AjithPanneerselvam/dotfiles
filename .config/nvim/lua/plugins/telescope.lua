return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },  -- Optional: file icons
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "vertical",
          vertical = "down:50%",
        },
      },
      files = {
        fd_opts = "--type f --hidden --exclude .git --exclude node_modules --exclude target",
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fr", fzf.lsp_references, { desc = "LSP references" })
    vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Document symbols" })
  end,
}
