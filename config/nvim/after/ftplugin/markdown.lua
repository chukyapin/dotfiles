local map = vim.keymap.set

map("n", "<leader>re", ":MarkdownPreviewToggle<CR>", { buffer = 0, silent = true })
