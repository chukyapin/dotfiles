local map = vim.keymap.set
local opts = { buffer = 0, silent = true }

-- Preview
map("n", "<C-p>", ":MarkdownPreviewToggle<CR>", opts)

map("n", "<Space>b", function()
  vim.cmd("normal ysiW*.")
end, opts)
map("n", "<Space>@", function()
  vim.cmd("normal ysiW`")
end, opts)
