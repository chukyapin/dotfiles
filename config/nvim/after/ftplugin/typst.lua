local map = vim.keymap.set

map("n", "<C-p>", ":write<CR> :TypstPreview<CR>", { buffer = 0, silent = true })
