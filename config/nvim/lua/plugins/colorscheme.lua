-- return {
--   "folke/tokyonight.nvim",
--   cond = true,
-- }
return {
  -- "craftzdog/solarized-osaka.nvim",
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency

    -- require("solarized-osaka").setup({
    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
    })

    -- vim.cmd("colorscheme solarized-osaka")
  end,
}
