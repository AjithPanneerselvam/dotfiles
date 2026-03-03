--------------------------------------------------------------------------------
-- OPTIONS
--------------------------------------------------------------------------------

-- Line numbers
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers (useful for jumps like 5j, 10k)

-- Tabs & indentation
vim.opt.tabstop = 4           -- Tab width
vim.opt.shiftwidth = 4        -- Indent width
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Auto-indent new lines

-- Search
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Unless search contains uppercase

-- Appearance
vim.opt.termguicolors = true  -- True color support
vim.opt.signcolumn = "yes"    -- Always show sign column (for LSP diagnostics)
vim.opt.cursorline = true     -- Highlight current line

-- Behavior
vim.opt.splitright = true     -- Vertical splits open to the right
vim.opt.splitbelow = true     -- Horizontal splits open below
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.undofile = true       -- Persistent undo history
vim.opt.swapfile = false      -- No swap files (git handles recovery)

-- Performance
vim.opt.updatetime = 250      -- Faster completion/diagnostics (default 4000ms)
vim.opt.timeoutlen = 300      -- Faster key sequence completion

--------------------------------------------------------------------------------
-- KEYMAPS
--------------------------------------------------------------------------------

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlight with Escape
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

--------------------------------------------------------------------------------
-- LSP KEYMAPS (set when LSP attaches to buffer)
--------------------------------------------------------------------------------

-- These are defined here but only activated when an LSP server attaches
-- See lua/plugins/lsp.lua for the on_attach function that uses these
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local buffer = ev.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "Go to references")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

    -- Info
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<leader>k", vim.lsp.buf.signature_help, "Signature help")

    -- Actions
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

    -- Diagnostics (navigate between errors/warnings)
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>d", vim.diagnostic.setloclist, "Diagnostics list")
  end,
})
