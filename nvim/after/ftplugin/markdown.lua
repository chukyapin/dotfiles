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

map("n", "<space>w", ":noautocmd w<CR>", opts)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "obsidian" },
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

-- Markdown かどうか
local function is_markdown()
  local ft = vim.bo.filetype
  return ft == "markdown" or ft == "md"
end

-- macism で使う IME ID （今あなたの環境で macism が出しているもの）
local IME_JP = "com.google.inputmethod.Japanese.base"
local IME_EN = "com.google.inputmethod.Japanese.Roman"

local function ime_on()
  vim.fn.jobstart({ "macism", IME_JP }, { detach = true })
end

local function ime_off()
  vim.fn.jobstart({ "macism", IME_EN }, { detach = true })
end

-- Autocmd グループ
local group = vim.api.nvim_create_augroup("MarkdownIME", { clear = true })

-- InsertEnter: Markdown のときだけ日本語 ON
vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    if is_markdown() then
      ime_on()
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    if is_markdown() then
      ime_off()
    end
  end,
})
