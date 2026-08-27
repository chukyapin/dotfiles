local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- delete without yank
map("n", "x", '"_x')

-- Inner words
map("o", "<leader>", "iw")

--
-- map("n", "<C-i>", "<C-i>")
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>", { noremap = true,})

-- V-BLOCK
map("v", "v", "<C-v>")

-- Yank &  dlelete
map("n", "<space><space>y", ":%+y<CR>", opts)
map("n", "<space><space>d", ":%+d<CR>", opts)

-- cnext / cprevious
map("n", "<Space>J", ":cnext<CR>", { silent = true })
map("n", "<Space>K", ":cprevious<CR>", { silent = true })

-- バッファ切り替え
map("n", "<Space>r", ":b#<CR>", { silent = true })
map("n", "<Space>e", ":BufferPick<CR>", { silent = true })
map("n", "<Space>l", ":BufferNext<CR>", { silent = true })
map("n", "<Space>h", ":BufferPrevious<CR>", { silent = true })
-- map("n", "<Space>w", ":BufferCloseAllButVisible<CR>", { silent = true })

-- Save & Quit
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)

-- replace
map("n", "S", 'yiw:%s/<C-r><C-r>"//g<Left><Left>')

-- 行補完
map("i", "<C-l>", "<C-x><C-l>", opts)

-- Indent in visual mode
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- Move
map("n", "<Left>", "<C-w>h")
map("n", "<down>", "<C-w>j")
map("n", "<up>", "<C-w>k")
map("n", "<right>", "<C-w>l")

--  Split windw
map("n", "|", ":vsplit<CR>", opts, { desc = "Split window vertically" })
map("n", "_", ":split<CR>", opts, { desc = "Split window horizontally" })

map({ "n", "v", "o" }, "M", "%")

map("n", "<space>dm", ":delmarks a-zA-Z0-9<CR>", opts)

-- j,k custom>
map("n", "j", function()
  if vim.v.count == 0 then
    return "gj"
  else
    return "m'" .. vim.v.count .. "j"
  end
end, { expr = true })

map("n", "k", function()
  if vim.v.count == 0 then
    return "gk"
  else
    return "m'" .. vim.v.count .. "k"
  end
end, { expr = true })

map("x", "j", function()
  if vim.v.count == 0 and vim.fn.mode(0) == "v" then
    return "gj"
  else
    return "j"
  end
end, { expr = true })

map("x", "k", function()
  if vim.v.count == 0 and vim.fn.mode(0) == "v" then
    return "gk"
  else
    return "k"
  end
end, { expr = true })

-- Buffer
map("n", "tn", ":tabedit ", opts)
map("n", "<space>cl", ":CloseBuffers<CR>", opts)

for _, quote in ipairs({ '"', "'", "`" }) do
  map({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
