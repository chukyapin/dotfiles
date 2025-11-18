local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.maplocalleader = ","

-- Do things witout affecting the registers
map("n", "x", '"_x')
-- map("n", "<space>p", '"0p')
-- map("n", "<space>P", '"0P')
-- map("v", "<space>p", '"0p')
map("n", "<space>c", '"_c')
map("n", "<space>C", "_C")
map("v", "<space>C", '"_C')
map("n", "<space>d", '"_d')
map("v", "<space>d", '"_d')
map("v", "<space>D", '"_D')

-- Inner words
map("o", "<space>", "iw")

-- Select all
-- map("n", "<C-a>", "gg<S-v>G")

-- Move a blocks of text up/down
-- map("n", "K", ":m .-2<CR>==", opts)
-- map("n", "J", ":m .+1<CR>==", opts)

-- Emacs
map("n", "<C-w>", 'vb"_d')

-- Buffer
map("n", "tn", ":tabedit ", opts)
map("n", "<space>l", ":BufferNext<CR>", opts)
map("n", "<space>h", ":BufferPrevious<CR>", opts)
map("n", "<space>w", ":BufferCloseAllButVisible<CR>", opts)

-- I use norm so much this makes sense
map({ "n", "v" }, "<space>n", ":norm ")
-- V-BLOCK
map("v", "v", "<C-v>")

-- Indent
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Redo
map("n", "U", "<C-r>")

-- Save & Quit
map("n", "<sPace>@", ":write<CR>", opts)
map("n", "<space>!", ":quit<CR>", opts)
map("n", "<space>~", ":wq<CR>", opts)

-- Split window
map("n", "ss", ":split<CR>")
map("n", "sv", ":vsplit<CR>")

-- Move window
map("n", "sk", "<c-w>k")
map("n", "sj", "<c-w>j")
map("n", "sh", "<c-w>h")
map("n", "sl", "<c-w>l")

map({ "n", "v" }, "m", "%")

map("n", "<space><space>y", ":%+y<CR>", opts)
map("n", "<space><space>d", ":%+d<CR>", opts)

-- mapu"n", "<space>lf", vim.lsp.buf.format)
