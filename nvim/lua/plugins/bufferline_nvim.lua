return {
  "https://github.com/akinsho/bufferline.nvim",
  -- event = "VeryLazy",
  event = { "BufAdd", "TabEnter" },
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs", -- "buffers", or "tabs",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
