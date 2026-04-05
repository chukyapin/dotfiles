return {
  "https://github.com/kevinhwang91/nvim-bqf",
  dependencies = { "junegunn/fzf" },
  event = "FileType qf",
  opts = {
    func_map = {
      openc = "<CR>",
      open = "o",
      split = "_",
      vsplit = "|",
      tabc = "<Space>t",
    },
  },
}
