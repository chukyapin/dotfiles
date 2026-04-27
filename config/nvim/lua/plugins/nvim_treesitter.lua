return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  cond = true,
  event = { "BufNewFile", "BufRead" },
  build = ":TSUpdate",
  int = function()
    vim.treesitter.language.register("bash", "zsh", "fish")
  end,
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "css",
      "diff",
      "dockerfile",
      "elixir",
      "gitignore",
      "gleam",
      "go",
      "html",
      "http",
      "javascript",
      "json",
      "kdl",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "svelte",
      "toml",
      "tsx",
      "typst",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
} -- texobjectsはパフォーマンスの問題から利用しない
