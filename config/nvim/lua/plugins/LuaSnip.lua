return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  run = "make install_jsregexp",
  config = function()
    require("luasnip").setup({})
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load()
  end,
}
