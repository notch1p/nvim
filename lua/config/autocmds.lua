-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
if not vim.g.vscode then
  -- require("neo-tree").setup({
  --   open_files_in_last_window = false,
  -- })
else
  local vscode = require("vscode")
  vim.keymap.set({ "n" }, "<leader>fr", function()
    vscode.action("workbench.action.openRecent")
  end)
  vim.keymap.set({ "n" }, "<leader>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
end
