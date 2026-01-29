return {
  "kevinhwang91/nvim-bqf",
  dependencies = { "junegunn/fzf" },
  event = "FileType qf",
  opts = {
    func_map = {
      openc = "<CR>",
      open = "o",
      split = "<c-s>",
      vsplit = "|",
      tabc = "<Space>t",
    },
  },
}
