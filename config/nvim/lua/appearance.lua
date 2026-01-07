vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,sjis"
vim.opt.fileformats = "unix,dos,mac"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.pumheight = 10

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 10
vim.opt.helplang = "ja"
vim.cmd("cabbrev h belowright vertical help")
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

--Hightlight
vim.api.nvim_set_hl(0, "YankHighlight", { reverse = true })
vim.api.nvim_set_hl(0, "Visual", { bg = "#565612" })

-- Split Behavior
vim.opt.splitbelow = true -- holizontal splits open berow
vim.opt.splitright = true -- vertical splits open to the right

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- File types
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

-- Yankした範囲をハイライトさせる
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})
