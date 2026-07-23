require("base")
require("filetype")
require("plugin")
require("appearance")
require("lsp")

vim.g.loaded_node_provider = 0

-- クリップボードとヤンクの同期
vim.opt.clipboard = "unnamedplus"

-- スワップファイルを作成しない(default: true)
vim.opt.swapfile = false

-- 行番号の表示(default: false)
vim.opt.number = true

vim.opt.relativenumber = true

-- 文字コード自動判別(default: "ucs-bom, utf-8, default, latin1")
vim.opt.fileencodings = "utf-8,sjis"

-- 改行コード自動判別 (default: "unix,dos")
vim.opt.fileformats = "unix,dos,mac"

-- 行末の1文字先までカーソルを移動できるように (default: 未設定)
vim.opt.virtualedit = "onemore"

-- スクロールした時 常に下に表示するバッファ行の数 (default: 0)
vim.opt.scrolloff = 100

-- 垂直方向の分割は左側ではなく右側にするか (default: false)
vim.opt.splitright = true

-- 水平方向の分割は上側ではなく下側にするか (default: false)
vim.opt.splitbelow = true

-- ファイルを開いたときに、前回カーソルのあった位置に移動する
vim.cmd([[
  augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  augroup END
]])

-- タブ入力の代わりにスペースを挿入するか (default: false)
vim.opt.expandtab = true

-- タブ文字の見た目を何文字分にするか (default: 8)
vim.opt.tabstop = 2

-- インデントを何文字分にするか (default: 8)
vim.opt.shiftwidth = 0 -- 0はtabstopと同じ値を使用

-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する (default: false)
vim.opt.ignorecase = true

-- 検索時に大文字を含んでいたら大/小を区別 (default: false)
vim.opt.smartcase = true -- ignorecase = true と組み合わせて使用

-- カーソル行強化 (default: false)
vim.opt.cursorline = true

-- Yankの範囲をハイライト
vim.api.nvim_set_hl(0, "YankHighlight", { reverse = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})

-- 置換時のインクリメンタルプレビューを分割ウィンドウに表示(default: nosplit)
vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.smartindent = true

vim.pack.add({})

vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Inner words
map("o", "<space>", "iw")

-- V-BLOCK
map("v", "v", "<C-v>")

map("n", "<space><space>y", ":%+y<CR>", opts)
map("n", "<space><space>d", ":%+d<CR>", opts)

-- Save & Quit
map("n", "<space>w", ":write<CR>", opts)
map("n", "<space>x", ":x<CR>", opts)

-- replace
map("n", "S", 'yiw:%s/<C-r><C-r>"//g<Left><Left>')

-- Indent in visual mode
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Move
map("n", "<Left>", "<C-w>h")
map("n", "<down>", "<C-w>j")
map("n", "<up>", "<C-w>k")
map("n", "<right>", "<C-w>l")

--  Split
map("n", "|", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "_", ":split<CR>", { desc = "Split window horizontally" })

-- map({ "n", "v", "o" }, "m", "%")
map("n", "<space>mp", ":delmarks a-zA-Z0-9<CR>", opts)

-- j,k custom
map("n", "j", function()
  if vim.v.count == 0 then
    return "gj"
  else
    return "m'" .. vim.v.count .. "j"
  end
end, { expr = true })

map("n", "k", function()
  if vim.v.count == 0 then
    return "gk"
  else
    return "m'" .. vim.v.count .. "k"
  end
end, { expr = true })

map("x", "j", function()
  if vim.v.count == 0 and vim.fn.mode(0) == "v" then
    return "gj"
  else
    return "j"
  end
end, { expr = true })

map("x", "k", function()
  if vim.v.count == 0 and vim.fn.mode(0) == "v" then
    return "gk"
  else
    return "k"
  end
end, { expr = true })

-- Buffer
map("n", "tn", ":tabedit ", opts)
map("n", "<space>cl", ":CloseBuffers<CR>", opts)

for _, quote in ipairs({ '"', "'", "`" }) do
  map({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
