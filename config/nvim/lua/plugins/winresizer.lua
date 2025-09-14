return {
  "simeji/winresizer",
  keys = function()
    local opts = { noremap = true, silent = true }
    return {
      { "<C-e>", "<Plug>WinResizerStartResize", opts },
    }
  end,
}
