return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luassert/library", words = { "assert" } },
        { path = "${3rd}/busted/library", words = { "describe" } },
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "snacks.nvim/lua/snacks" },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
}
