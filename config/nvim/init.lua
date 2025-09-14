require("filetype")
require("clipboard")
require("plugin")
require("appearance")
require("autocmds")
require("keymaps")
require("lsp")

require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})
vim.cmd([[colorscheme tokyonight]])
