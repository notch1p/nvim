-- Lua
-- return {
--   {
--     'abecodes/tabout.nvim',
--     lazy = false,
--     config = function()
--       require('tabout').setup {
--         tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
--         backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
--         act_as_tab = true, -- shift content if tab out is not possible
--         act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
--         default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
--         default_shift_tab = '<C-d>', -- reverse shift default action,
--         enable_backwards = true, -- well ...
--         completion = false, -- if the tabkey is used in a completion pum
--         tabouts = {
--           { open = "'", close = "'" },
--           { open = '"', close = '"' },
--           { open = '`', close = '`' },
--           { open = '(', close = ')' },
--           { open = '[', close = ']' },
--           { open = '{', close = '}' }
--         },
--         ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
--         exclude = {} -- tabout will ignore these filetypes
--       }
--     end,
--     dependencies = { -- These are optional
--       "nvim-treesitter/nvim-treesitter",
--       "L3MON4D3/LuaSnip",
--       "hrsh7th/nvim-cmp"
--     },
--     opt = true,  -- Set this to true if the plugin is optional
--     event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
--     priority = 1000,
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       -- Disable default tab keybinding in LuaSnip
--       return {}
--     end,
--   },
-- }
--
return {
  "kawre/neotab.nvim",
  event = "InsertEnter",
  opts = {
    tabkey = "<Tab>",
    act_as_tab = true,
    behavior = "nested", ---@type ntab.behavior
    pairs = { ---@type ntab.pair[]
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = "`", close = "`" },
      { open = "<", close = ">" },
    },
    exclude = {},
    smart_punctuators = {
      enabled = true,
      semicolon = {
        enabled = true,
        ft = { "cs", "c", "cpp", "java" },
      },
      escape = {
        enabled = true,
        triggers = { ---@type table<string, ntab.trigger>
          ["+"] = {
            pairs = {
              { open = '"', close = '"' },
            },
            -- string.format(format, typed_char)
            format = " %s ", -- " + "
            ft = { "java" },
          },
          [","] = {
            pairs = {
              { open = "'", close = "'" },
              { open = '"', close = '"' },
            },
            format = "%s ", -- ", "
          },
          ["="] = {
            pairs = {
              { open = "(", close = ")" },
            },
            ft = { "javascript", "typescript" },
            format = " %s> ", -- ` => `
            -- string.match(text_between_pairs, cond)
            cond = "^$", -- match only pairs with empty content
          },
        },
      },
    },
  },
}
