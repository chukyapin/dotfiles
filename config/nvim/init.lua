require("filetype")
require("clipboard")
require("plugin")
require("appearance")
require("autocmds")
require("keymaps")
require("lsp")

require("solarized-osaka").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})
vim.cmd([[colorscheme solarized-osaka]])
