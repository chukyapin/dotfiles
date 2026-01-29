---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    { "<Space>a", "<cmd>Yazi<cr>", desc = "Yazi" },
    { "<Space>+", "<cmd>Yazi toggle<cr>", desc = "Yazi restore" },
  },
  ---@type YaziConfig | {}
  opts = {
    keymaps = {
      open_file_in_vertical_split = "|",

      -- open_file_in_horizontal_split = "<C-s>",
      send_to_quickfix_list = "<c-s-o>",
      cycle_open_buffers = "<M-6>", -- ignore
    },
  },
}
