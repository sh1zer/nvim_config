-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Close neo-tree (and other sidebars) when :q would leave only them, so a
-- single :q quits Neovim instead of needing a second one.
vim.api.nvim_create_autocmd("QuitPre", {
  group = vim.api.nvim_create_augroup("close_sidebars_on_quit", { clear = true }),
  callback = function()
    local sidebars = { "neo-tree", "Outline", "aerial", "trouble", "qf", "help" }
    local real, side = 0, {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative == "" then
        local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
        if vim.tbl_contains(sidebars, ft) then
          table.insert(side, win)
        else
          real = real + 1
        end
      end
    end
    -- `real` still counts the window being quit
    if real == 1 then
      for _, win in ipairs(side) do
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})
