local map = vim.keymap.set

map("n", "<C-p>", ":MarkdownPreviewToggle<CR>", { buffer = 0, silent = true })
