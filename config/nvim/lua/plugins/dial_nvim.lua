return {
  -- Better increase/descrease
  "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%m/%d"],
        augend.date.alias["%m-%d"],
        augend.constant.alias.bool,
        augend.constant.alias.ja_weekday,
        augend.constant.alias.ja_weekday_full,
        augend.semver.alias.semver,
        augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
        augend.constant.new({ elements = { "==", "!=" }, word = false, cyclic = true }),
        augend.constant.new({ elements = { "and", "or" } }),
        augend.constant.new({ elements = { "let", "const" } }),
        -- augend.case.new({
        --   types = { "camelCase", "snake_case", "PascalCase", "SCREAMING_SNAKE_CASE" },
        --   cyclic = true,
        -- }),
      },
    })
  end,
}
