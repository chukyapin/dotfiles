return {
  -- lazy.nvim の spec に追記
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      vim.g.codeium_disable_bindings = 1
    end,
  },
}
