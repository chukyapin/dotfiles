local map = vim.keymap.set
local opts = { buffer = 0, noremap = true, silent = true }

local tabwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.tabstop = tabwidth
vim.opt_local.softtabstop = tabwidth
vim.opt_local.shiftwidth = tabwidth

-- " F5: 今開いているファイルを Python で実行
map("n", "F5", ':w<CR>:!python3 " % "<CR>', opts)

-- " F6: 仮想環境の Python で実行（venv 下を想定）
map("n", "<F6>", ':w<CR>:!./venv/bin/python " % "<CR>', opts)
