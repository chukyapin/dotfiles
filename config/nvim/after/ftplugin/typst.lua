local map = vim.keymap.set
local opts = { buffer = 0, silent = true }

map("n", "<C-p>", ":write<CR> :TypstPreview<CR>", opts)
