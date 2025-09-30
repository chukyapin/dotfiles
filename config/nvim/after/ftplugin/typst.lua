local map = vim.keymap.set

map("n", "<space>re", ":write<CR> :TypstPreview<CR>", { buffer = 0, silent = true })
