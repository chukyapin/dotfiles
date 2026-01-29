local map = vim.keymap.set
local opts = { buffer = 0, noremap = true, silent = true }

map("n", "<C-p>", ":write<CR> :TypstPreview<CR>", opts)

map("n", "<space>b", function()
  vim.cmd("normal ysiW*")
end, opts)
