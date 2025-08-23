vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 10
vim.opt.helplang = "ja"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildmenu = true
vim.opt.swapfile = false
vim.opt.smarttab = true
vim.opt.shell = "fish"
vim.opt.cmdheight = 0
vim.opt.mouse = ""

-- Split Behavior
vim.opt.splitbelow = true -- Holizontal splits open berow
vim.opt.splitright = true -- Vertical splits open to the right

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- File types
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.g.lazyvim_cmp = "blink.cmp"
