-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":", { noremap = true, silent = false })

-- LazyVim binds <leader>l straight to :Lazy, which makes it unusable as a prefix:
-- any <leader>l* mapping only wins if you finish typing it within 'timeoutlen'.
-- Move it to <leader>lz so <leader>l is a free prefix (e.g. leet.nvim's <leader>ld).
pcall(vim.keymap.del, "n", "<leader>l")
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Restart LSP servers and wipe stale diagnostics from every buffer.
-- Useful after sweeping refactors, when pyright keeps showing errors that
-- were already fixed in files it hasn't re-analysed.
-- Nvim 0.12 ships a builtin `:lsp` command, which makes nvim-lspconfig skip
-- defining `:LspRestart` entirely -- so drive `:lsp restart` directly.
-- Bare `:lsp restart` only covers the current buffer's clients, so name them all.
vim.keymap.set("n", "<leader>lr", function()
  local names = {}
  for _, client in ipairs(vim.lsp.get_clients()) do
    names[client.name] = true
  end
  vim.diagnostic.reset()
  if next(names) == nil then
    vim.notify("No active LSP clients", vim.log.levels.WARN)
    return
  end
  vim.cmd("lsp restart " .. table.concat(vim.tbl_keys(names), " "))
  vim.notify("LSP restarted, diagnostics cleared")
end, { desc = "Restart LSP + clear diagnostics" })
