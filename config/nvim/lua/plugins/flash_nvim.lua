return {
  "https://github.com/folke/flash.nvim",
  cond = true,
  event = "VeryLazy",
  opts = {
    label = {
      distance = false,
    },
    modes = {
      search = { enabled = false },
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      "<CR>",
      mode = { "n", "x", "o", "v" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "R",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "<TAB>",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#efef33", bold = true })
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#64b5f6", bold = true })
      end,
    })
  end,
}
