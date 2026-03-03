-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before loading plugins (required by lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core settings (options + keymaps)
require("core")

-- Initialize lazy.nvim with plugins from lua/plugins/
require("lazy").setup("plugins", {
  -- Lock plugin versions - only update when you explicitly run :Lazy update
  defaults = {
    lazy = false,  -- Don't lazy-load by default (we'll set per-plugin)
  },
  install = {
    colorscheme = { "default" },  -- Use default colorscheme during install
  },
  checker = {
    enabled = false,  -- Don't auto-check for updates
  },
  change_detection = {
    enabled = false,  -- Don't auto-reload on config change (prevents surprises)
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
