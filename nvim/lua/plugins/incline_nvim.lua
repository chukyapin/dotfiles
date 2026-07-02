return {
  "b0o/incline.nvim",
  event = { "VeryLazy" },
  opts = function()
    return {
      highlight = {
        groups = {
          -- InclineNormal = { guibg = palette.mantle, guifg = fg_active },
          -- InclineNormalNC = { guibg = "none", guifg = fg_inactive },
        },
      },
      window = {
        options = {
          winblend = 0,
        },
        placement = {
          horizontal = "right",
          vertical = "top",
        },
        margin = { horizontal = 0, vertical = 0 },
        padding = 2,
      },
      render = render,
    }
  end,
}
