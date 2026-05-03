-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.spelllang = {}
vim.opt.spell = false
vim.g.suda_smart_edit = 1

local set_hl_for_floating_window = function()
  vim.api.nvim_set_hl(0, "NormalFloat", {
    --    link = "Pmenu",
    link = "CursorLine",
  })
  vim.api.nvim_set_hl(0, "FloatBorder", {
    link = "CursorLine",
  })
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "Avoid overwritten by loading color schemes later",
  callback = set_hl_for_floating_window,
})

--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--  border = "rounded",
--})
