local map = vim.keymap.set

map("n", "<space>re", ":MarkdownPreviewToggle<CR>", { buffer = 0, silent = true })
