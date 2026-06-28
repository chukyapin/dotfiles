-- 挨拶メッセージを非表示
vim.opt.shortmess:append("I")

-- ╭─────────────────────────────────────────────────────────╮
-- │                          挙動                           │
-- ╰─────────────────────────────────────────────────────────╯

-- 文字コード自動判別
vim.opt.fileencodings = "utf-8,sjis"

-- 改行コード自動判別
vim.opt.fileformats = "unix,dos,mac"

-- swapfileを作成しない
vim.opt.swapfile = false

-- タブを基本2文字に
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0

-- タブの代わりにスペースを挿入する(default: false)
vim.opt.expandtab = true

-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する(default: false)
vim.opt.ignorecase = true

-- 検索時に大文字を含んでいたら大/小を区別
vim.opt.smartcase = true

-- 置換時のインクリメンタルプレビューを分割ウィンドウに表示(default: nosplit)
vim.opt.inccommand = "split"

-- スクロールした時 常に下に表示するバッファ行の数
vim.opt.scrolloff = 100

-- 垂直分割は必ず右側(default: false)
vim.opt.splitright = true -- vertical splits open to the right

-- 水平分割は必ず下側(default: false)
vim.opt.splitbelow = true -- holizontal splits open berow

-- 最後に開いていた行を開く
vim.cmd([[
  augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  augroup END
]])

-- 外部からファイルを変更されたら反映する
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
  pattern = "*",
  command = "checktime",
})

-- quick fix listは横に最大で開く
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.cmd("wincmd J")
  end,
})

-- -- :quit時に特殊ウィンドウ(quickfix, help等)のみが残っている場合は自動で閉じる
-- -- ref: https://zenn.dev/vim_jp/articles/ff6cd224fab0c7
-- vim.api.nvim_create_autocmd("QuitPre", {
--   callback = function()
--     -- 現在のウィンドウ番号を取得
--     local current_win = vim.api.nvim_get_current_win()
--     -- すべてのウィンドウをループして調べる
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--       -- カレント以外を調査
--       if win ~= current_win then
--         local buf = vim.api.nvim_win_get_buf(win)
--         -- buftypeが空文字（通常のバッファ）があればループ終了
--         if vim.bo[buf].buftype == "" then
--           return
--         end
--       end
--     end
--     -- ここまで来たらカレント以外がすべて特殊ウィンドウということなので
--     -- カレント以外をすべて閉じる
--     vim.cmd.only({ bang = true })
--     -- この後、ウィンドウ1つの状態でquitが実行されるので、Vimが終了する
--   end,
--   desc = "Close all special buffers and quit Neovim",
-- })

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

vim.api.nvim_create_user_command("CloseBuffers", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers_to_keep = {}
  local closed_count = 0
  -- 現在のバッファと変更のあるバッファをリストに追加
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "modified") or buf == current_buf then
      table.insert(buffers_to_keep, buf)
    end
  end
  -- 保持するバッファ以外を閉じる
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not vim.tbl_contains(buffers_to_keep, buf) then
      if pcall(vim.api.nvim_buf_delete, buf, { force = false }) then
        closed_count = closed_count + 1
      end
    end
  end
  vim.notify(closed_count .. " buffers closed", vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("QuitClean", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
    if buftype ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
  vim.cmd("quit")
end, {})
