return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = "|",
          last_indent_marker = "`",
        },
        icon = {
          folder_closed = "+",
          folder_open = "-",
          folder_empty = "+",
        },
        name = {
          use_git_status_colors = false,
        },
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "U",
            ignored = "I",
            unstaged = "",
            staged = "",
            conflict = "C",
          },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        components = {
          icon = function()
            return {}  -- Return empty to disable file icons
          end,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",  -- Don't conflict with leader
        },
      },
    })

    -- Toggle file tree with <leader>e
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
  end,
}
