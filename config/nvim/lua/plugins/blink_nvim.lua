return {
  "https://github.com/saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = { documentation = { auto_show = true } },
    list = {
      selection = {
        auto_insert = false,
      },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    cmdline = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
