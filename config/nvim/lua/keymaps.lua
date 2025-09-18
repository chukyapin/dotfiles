local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Do things witout affecting the registers
map("n", "x", '"_x')
-- map("n", "<Leader>p", '"0p')
-- map("n", "<Leader>P", '"0P')
-- map("v", "<Leader>p", '"0p')
map("n", "<leader>c", '"_c')
map("n", "<leader>C", '"_C')
map("v", "<leader>C", '"_C')
map("n", "<leader>d", '"_d')
map("n", "<leader>D", '"_D')
map("v", "<leader>d", '"_d')
map("v", "<leader>D", '"_D')

-- Move a blocks of text up/down
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)

-- Emacs
map("n", "<C-w>", 'vb"_d')

-- Split window
map("n", "-", ":split<CR>")
map("n", "\\", ":vsplit<CR>")

-- Buffer
map("n", "L", ":BufferNext<CR>", opts)
map("n", "H", ":BufferPrevious<CR>", opts)
map("n", "<leader>w", ":BufferCloseAllButVisible<CR>", opts)

-- V-BLOCK
map("v", "v", "<C-v>")

-- Indent
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Redo
map("n", "U", "<C-r>")

-- Save & Quit
map("n", "<leader>@", ":write<CR>", opts)
map("n", "<leader>!", ":quit<CR>", opts)
map("n", "<leader>~", ":wq<CR>", opts)

-- Move window
map("n", "<C-k>", "<c-w>k")
map("n", "<C-j>", "<c-w>j")
map("n", "<C-h>", "<c-w>h")
map("n", "<C-l>", "<c-w>l")

map({ "n", "v" }, "m", "%")

map("n", "<leader>y", ":%+y<CR>", opts)
map("n", "<leader>d", ":%+d<CR>", opts)

map("n", "<leader>lf", vim.lsp.buf.format)

-- diagnostic
vim.keymap.set("n", "<A-d>", function()
  vim.diagnostic.jump({ float = false, count = 1 })
end)
