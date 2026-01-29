vim.cmd("colorscheme solarized-osaka")

vim.opt.encoding = "utf-8"

vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true
vim.opt.pumheight = 10
vim.opt.pumblend = 10

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.helplang = "ja"
vim.cmd("cabbrev h belowright vertical help")
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildmenu = true
vim.opt.shell = "fish"
vim.opt.cmdheight = 0
vim.opt.mouse = ""

-- Clear statusline
vim.opt.laststatus = 0
vim.opt.statusline = "-"
vim.opt.fillchars:append({ stl = "-", stlnc = "-" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- File types
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
