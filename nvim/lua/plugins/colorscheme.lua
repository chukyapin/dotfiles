return {
  "ellisonleao/gruvbox.nvim",
  cond = true,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}

-- return {
--   -- "craftzdog/solarized-osaka.nvim",
--   -- "folke/tokyonight.nvim",
--   "https://github.com/ellisonleao/gruvbox.nvim",
--   cond = true,
--   priority = 1000,
--   config = function()
--     local transparent = true -- set to true if you would like to enable transparency
--     -- require("solarized-osaka").setup({
--     -- require("tokyonight").setup({
--     require("gruvbox").setup({
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--     })
--     -- vim.cmd("colorscheme solarized-osaka")
--     -- vim.cmd("colorscheme tokyonight")
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
