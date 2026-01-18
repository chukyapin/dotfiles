local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map("n", "<space>P", '"0P')
-- map("v", "<space>p", '"0p')
-- map("n", "<space>c", '"_c')
-- map("n", "<space>C", '"_C')
-- map("v", "<space>C", '"_C')
-- map("n", "<space>d", '"_d')
-- map("n", "<space>D", '"_D')
-- map("v", "<space>d", '"_d')
-- map("v", "<space>D", '"_D')

-- hjkl
vim.keymap.set({ "n", "x" }, "j", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    -- @see https://eiji.page/blog/neovim-remeber-jump-jk/
    return "m'" .. vim.v.count .. "j"
  end
  return "gj"
end, { expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    -- @see https://eiji.page/blog/neovim-remeber-jump-jk/
    return "m'" .. vim.v.count .. "k"
  end
  return "gk"
end, { expr = true })

-- Inner words
map("o", "<space>", "iw")

-- Buffer
map("n", "tn", ":tabedit ", opts)
-- map("n", "<tab>", ":BufferNext<CR>", opts)
-- map("n", "<S-tab>", ":BufferPrevious<CR>", opts)
map("n", "<space>w", ":CloseBuffers<CR>", opts)

-- map("n", "<space>q", ":QuitClean<CR>", opts)

-- V-BLOCK
map("v", "v", "<C-v>")

--  Split
map("n", "-", ":split<CR>")
map("n", "+", ":vsplit<CR>")

-- Move
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- Indent
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Redo
map("n", "U", "<C-r>")

-- Save & Quit
map("n", "<space>@", ":write<CR>", opts)
map("n", "<space>!", ":quit<CR>", opts)
map("n", "<space>~", ":wq<CR>", opts)

map({ "n", "v", "o" }, "m", "%")

map("n", "<space><space>y", ":%+y<CR>", opts)
map("n", "<space><space>d", ":%+d<CR>", opts)

-- map("n", "<space>lf", vim.lsp.buf.format)

for _, quote in ipairs({ '"', "'", "`" }) do
  map({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
