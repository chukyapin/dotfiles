return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-y>",
      },
    },
    filetypes = {
      ["*"] = true,
    },
  },
}
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({
--       suggestion = { enabled = false },
--       panel = { enabled = false },
--       server_opts_overrides = {
--         trace = "verbose",
--         cmd = {
--           vim.fn.expand("~/.local/share/mise/shims/copilot-language-server"),
--           "--stdio",
--         },
--         settings = {
--           advanced = {
--             listCount = 10,
--             inlineSuggestCount = 3,
--           },
--         },
--       },
--     })
--   end,
-- }
