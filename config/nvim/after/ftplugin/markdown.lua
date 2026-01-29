local map = vim.keymap.set
local opts = { buffer = 0, noremap = true, silent = true }

-- Preview
map("n", "<C-p>", ":MarkdownPreviewToggle<CR>", opts)

map("n", "<space>b", function()
  vim.cmd("normal ysiW*.")
end, opts)
map("n", "<space>@", function()
  vim.cmd("normal ysiW`")
end, opts)
