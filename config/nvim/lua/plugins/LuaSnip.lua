return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  run = "make install_jsregexp",
  config = function()
    require("luasnip").setup({ enable_autosnippets = true })
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
    local ls = require("luasnip")
    vim.keymap.set("i", "<C-e>", function()
      ls.expand_or_jump(1)
    end, { silent = true })
  end,
}
