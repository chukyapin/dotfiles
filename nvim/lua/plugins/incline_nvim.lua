-- return {
--   "b0o/incline.nvim",
--   event = "VeryLazy",
--   opts = function()
--     -- solarized-osaka のパレットを取得
--     local ok, tn = pcall(require, "solarized-osaka.colors")
--     local colors = ok and tn.setup() or require("solarized-osaka.colors").def
--
--     local palette = colors
--     local fg_active = palette.fg -- アクティブ用
--     local fg_inactive = palette.comment -- 非アクティブ用（好みで変えてOK）
--
--     -- ここで Diagnostics + Git Diff + Icon + Filename の render を定義
--     local devicons = require("nvim-web-devicons")
--
--     local function render(props)
--       local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--       if filename == "" then
--         filename = "[No Name]"
--       end
--
--       local ft_icon, ft_color = devicons.get_icon_color(filename)
--
--       local function get_git_diff()
--         local icons = { removed = "", modified = "", added = "" }
--         local signs = vim.b[props.buf].gitsigns_status_dict
--         local labels = {}
--         if signs == nil then
--           return labels
--         end
--         for name, icon in pairs(icons) do
--           if tonumber(signs[name]) and signs[name] > 0 then
--             table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
--           end
--         end
--         if #labels > 0 then
--           table.insert(labels, { "┊ " })
--         end
--         return labels
--       end
--
--       local function get_diagnostic_label()
--         local icons = {
--           error = "",
--           warn = "",
--           info = "",
--           hint = "",
--         }
--         local label = {}
--
--         for severity, icon in pairs(icons) do
--           local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
--           if n > 0 then
--             table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
--           end
--         end
--         if #label > 0 then
--           table.insert(label, { "┊ " })
--         end
--         return label
--       end
--
--       return {
--         { get_diagnostic_label() },
--         { get_git_diff() },
--         { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
--         { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
--         { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
--       }
--     end
--
--     return {
--       highlight = {
--         groups = {
--           InclineNormal = {
--             guibg = palette.bg_visual,
--             guifg = palette.fg,
--             gui = "bold",
--         },
--           InclineNormalNC = {
--             guibg = "none",
--             guifg = fg_inactive,
--           },
--         },
--       },
--       window = {
--         options = {
--           winblend = 0,
--         },
--         placement = {
--           horizontal = "right",
--           vertical = "top",
--         },
--         margin = { horizontal = 0, vertical = 0 },
--         padding = 2,
--       },
--       render = render,
--     }
--   end,
-- }
--
--
return
 {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base4 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          -- 2つ上の階層までディレクトリを表示
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:~:.:h:h")
            .. "/"
            .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { "" }, { filename } }
        end,
      })
    end,
}
