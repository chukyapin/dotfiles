return {
  -- Better increase/descrease
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      mode = "n",
      desc = "dial increment",
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      mode = "n",
      desc = "dial decrement",
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gnormal")
      end,
      mode = "n",
      desc = "dial increment",
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gnormal")
      end,
      mode = "n",
      desc = "dial decrement",
    },
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "visual")
      end,
      mode = "v",
      desc = "dial increment",
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "visual")
      end,
      mode = "v",
      desc = "dial decrement",
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gvisual")
      end,
      mode = "v",
      desc = "dial increment",
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gvisual")
      end,
      mode = "v",
      desc = "dial decrement",
    },
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
        augend.constant.alias.bool,
        augend.constant.alias.ja_weekday,
        augend.constant.alias.ja_weekday_full,
        augend.semver.alias.semver,
        augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
        augend.constant.new({ elements = { "==", "!=" }, word = false, cyclic = true }),
        augend.constant.new({ elements = { "and", "or" } }),
        augend.constant.new({ elements = { "let", "const" } }),
        augend.case.new({
          types = { "camelCase", "snake_case", "PascalCase", "SCREAMING_SNAKE_CASE" },
          cyclic = true,
        }),
      },
    })
  end,
}
