return {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  branch = "master",
  event = { "BufNewFile", "BufRead" },
  build = ":TSUpdate",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "css",
      "html",
      "javascript",
      "python",
      "lua",
      "svelte",
      "tsx",
      "typst",
      "typescript",
      "vue",
    })
  end,
}
