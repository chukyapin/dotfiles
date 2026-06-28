return {
  "https://github.com/sindrets/diffview.nvim",
  cmd = "DiffviewOpen",
  keys = {
    { "<Space>v", ":DiffviewToggle<CR>", silent = true },
    { "<Space>f", ":DiffviewFileHistory %<CR>", silent = true },
  },
  opts = {
    hooks = {
      diff_buf_win_enter = function()
        vim.opt_local_foldenable = false
      end,
    },
  },
}
