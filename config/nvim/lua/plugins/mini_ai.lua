return {
  "nvim-mini/mini.ai",
  version = false,
  event = "VeryLazy",
  opts = {
    mappings = {
      -- 0.12の v_an / v_in を優先するため、mini.ai側は無効化
      around_next = "",
      inside_next = "",
      around_last = "",
      inside_last = "",
    },
  },
}
