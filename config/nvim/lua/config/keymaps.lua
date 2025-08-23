local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
map("n", "x", '"_x')
-- map("n", "<Leader>p", '"0p')
-- map("n", "<Leader>P", '"0P')
-- map("v", "<Leader>p", '"0p')
map("n", "<Leader>c", '"_c')
map("n", "<Leader>C", '"_C')
map("v", "<Leader>C", '"_C')
map("n", "<Leader>d", '"_d')
map("n", "<Leader>D", '"_D')
map("v", "<Leader>d", '"_d')
map("v", "<Leader>D", '"_D')

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Split window
map("n", "-", ":split<CR>", opts)
map("n", "\\", ":vsplit<CR>", opts)

-- V-BLOCK
map("v", "v", "<C-v>")

-- Indent
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Redo
map("n", "U", "<C-r>")

-- Save & Quit
map("n", "<A-w>", ":write<CR>")
map("n", "<A-q>", ":quit<CR>")
map("n", "<A-wq>", ":wq<CR>")

-- New tab
map("n", "<tab><tab>", ":tabedit<tab>")

-- diagnostics
map("n", "<A-d>", function()
  vim.diagnostic.jump({ float = false, count = 1 })
end, opts)

-- Move window
map("n", "<Up>", "<c-w>k")
map("n", "<Down>", "<c-w>j")
map("n", "<Left>", "<c-w>h")
map("n", "<Right>", "<c-w>l")
