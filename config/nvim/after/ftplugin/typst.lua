local map = vim.keymap.set

map("n", "<leader>re", ":write<CR> :TypstPreview<CR>", { buffer = 0 })

-- vim.cmd([[
-- setlocal wrapmargin=0
-- setlocal formatoptions+=t
-- setlocal linebbreak
-- setlocal spell
-- setlocal wrap
-- ]])
