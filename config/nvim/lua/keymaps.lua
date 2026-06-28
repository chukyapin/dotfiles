local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- map("v", "<space>p", '"0p')
-- map("n", "<space>c", '"_c')
-- map("n", "<space>C", '"_C')
-- map("v", "<space>C", '"_C')
-- map("n", "<space>d", '"_d')
-- map("n", "<space>D", '"_D')
-- map("v", "<space>d", '"_d')
-- map("v", "<space>D", '"_D')

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

-- Increment / Decrement
-- map("n", "+", "<C-a>", opts)
-- map("n", "-", "<C-x>", opts)

-- Inner words
map("o", "<space>", "iw")

-- Buffer
map("n", "tn", ":tabedit ", opts)
map("n", "<space>cl", ":CloseBuffers<CR>", opts)

-- V-BLOCK
map("v", "v", "<C-v>")

--  Split
map("n", "_", ":split<CR>", { desc = "Split window horizontally" })
map("n", "|", ":vsplit<CR>", { desc = "Split window vertically" })

-- Move
map("n", "<Left>", "<C-w>h")
map("n", "<down>", "<C-w>j")
map("n", "<up>", "<C-w>k")
map("n", "<right>", "<C-w>l")

-- Indent in visual mode
map("v", "<C-t>", ">gv")
map("v", "<C-d>", "<gv")

-- replace
map("n", "S", 'yiw:%s/<C-r><C-r>"//g<Left><Left>')

-- Save & Quit
map("n", "<space>w", ":write<CR>", opts)
map("n", "<space>x", ":x<CR>", opts)

-- map({ "n", "v", "o" }, "m", "%")

map("n", "<space><space>y", ":%+y<CR>", opts)
map("n", "<space><space>d", ":%+d<CR>", opts)

for _, quote in ipairs({ '"', "'", "`" }) do
  map({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
