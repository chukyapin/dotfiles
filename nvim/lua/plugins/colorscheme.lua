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
