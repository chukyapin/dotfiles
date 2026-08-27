return {
  -- "ellisonleao/gruvbox.nvim",
  "craftzdog/solarized-osaka.nvim",
  -- "folke/tokyonight.nvim",
  cond = true,
  priority = 1000,
  config = function()
    -- require("gruvbox").setup({
      require("solarized-osaka").setup({
    -- require("tokyonight").setup({
      -- transparent_mode = true,
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    -- vim.cmd("colorscheme gruvbox")
    vim.cmd("colorscheme solarized-osaka")
    -- vim.cmd("colorscheme tokyonight")
  end,
}
