local map = vim.keymap.set

map("n", "<leader>re", ":write<CR> :TypstPreview<CR>", { buffer = 0, silent = true })
