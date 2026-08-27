vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("plugin")
require("base")
require("keymaps")
require("filetype")
require("appearance")
require("lsp")

vim.opt.clipboard = "unnamedplus"

-- スワップファイルを作成しない(default: true)
vim.opt.swapfile = false

-- 文字コード自動判別(default: "ucs-bom, utf-8, default, latin1")
vim.opt.fileencodings = "utf-8,sjis"

-- 改行コード自動判別 (default: "unix,dos")
vim.opt.fileformats = "unix,dos,mac"

-- 行末の1文字先までカーソルを移動できるように (default: 未設定)
-- vim.opt.virtualedit = "onemore"

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

-- Yankの範囲をハイライト

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- vim.api.nvim_set_hl(0, "YankHighlight", { reverse = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   pattern = "*",
--   callback = function()
--     -- vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
--     vim.hl({ higroup = "YankHighlight", timeout = 200 })
--   end,
-- })

-- 置換時のインクリメンタルプレビューを分割ウィンドウに表示(default: nosplit)
vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.smartindent = true
