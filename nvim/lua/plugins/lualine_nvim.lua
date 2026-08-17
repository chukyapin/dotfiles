-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   event = { "BufNewFile", "BufRead" },
-- }

-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function(_, opts)
--     opts.sections = opts.sections or {}
--     opts.sections.lualine_x = opts.sections.lualine_x or {}
--     ---@type table<string, {updated:number, total:number, enabled: boolean, status:string[]}>
--     local mutagen = {}
--
--     local function mutagen_status()
--       local cwd = vim.uv.cwd() or "."
--       mutagen[cwd] = mutagen[cwd]
--         or {
--           updated = 0,
--           total = 0,
--           enabled = vim.fs.find("mutagen.yml", { path = cwd, upward = true })[1] ~= nil,
--           status = {},
--         }
--       local now = vim.uv.now() -- timestamp in milliseconds
--       local refresh = mutagen[cwd].updated + 10000 < now
--       if #mutagen[cwd].status > 0 then
--         refresh = mutagen[cwd].updated + 1000 < now
--       end
--       if mutagen[cwd].enabled and refresh then
--         ---@type {name:string, status:string, idle:boolean}[]
--         local sessions = {}
--         local lines = vim.fn.systemlist("mutagen project list")
--         local status = {}
--         local name = nil
--         for _, line in ipairs(lines) do
--           local n = line:match("^Name: (.*)")
--           if n then
--             name = n
--           end
--           local s = line:match("^Status: (.*)")
--           if s then
--             table.insert(sessions, {
--               name = name,
--               status = s,
--               idle = s == "Watching for changes",
--             })
--           end
--         end
--         for _, session in ipairs(sessions) do
--           if not session.idle then
--             table.insert(status, session.name .. ": " .. session.status)
--           end
--         end
--         mutagen[cwd].updated = now
--         mutagen[cwd].total = #sessions
--         mutagen[cwd].status = status
--         if #sessions == 0 then
--           vim.notify("Mutagen is not running", vim.log.levels.ERROR, { title = "Mutagen" })
--         end
--       end
--       return mutagen[cwd]
--     end
--
--     local error_color = { fg = Snacks.util.color("DiagnosticError") }
--     local ok_color = { fg = Snacks.util.color("DiagnosticInfo") }
--     table.insert(opts.sections.lualine_x, {
--       cond = function()
--         return mutagen_status().enabled
--      end,
--       color = function()
--         return (mutagen_status().total == 0 or mutagen_status().status[1]) and error_color or ok_color
--       end,
--       function()
--         local s = mutagen_status()
--         local msg = s.total
--         if #s.status > 0 then
--           msg = msg .. " | " .. table.concat(s.status, " | ")
--         end
--         return (s.total == 0 and "󰋘 " or "󰋙 ") .. msg
--       end,
--     })
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-web-devicons", opt = true },
  event = { "BufNewFile", "BufRead" },
  opts = function()
    local theme_base = {
      a = { fg = "#1b1d2b", bg = "#82aaff", gui = "bold" },
      b = { fg = "#82aaff", bg = "#3b4261" },
      c = { fg = "#828bb8", bg = "#1e2030" },
    }
    local theme_base_active = {
      a = { fg = "#efef33", bg = "#888888", gui = "bold" },
      b = { fg = "#82aaff", bg = "#3b4261" },
      c = { fg = "#828bb8", bg = "#1e2030" },
    }
    local custom_theme = {
      normal = theme_base_active,
      insert = theme_base_active,
      visual = theme_base_active,
      replace = theme_base,
      command = theme_base,
      inactive = theme_base,
    }

    -- local fmt_filename = function(str)
    --   -- OilのURLスキームを除去
    --   local path = str:gsub("^oil://", "")
    --
    --   -- カレントディレクトリからの相対パス
    --   local cwd = vim.fn.getcwd()
    --   if path:sub(1, #cwd) == cwd then
    --     local relative = path:sub(#cwd + 2) -- +2 to skip the trailing slash
    --     return relative ~= "" and relative or "."
    --   end
    --
    --   -- home directoryを~に
    --   local home = vim.fn.expand("~")
    --   if path:sub(1, #home) == home then
    --     path = "~" .. path:sub(#home + 1)
    --   end
    --
    --   return path
    -- end

    -- return {
    --   options = {
    --     theme = custom_theme,
    --     component_separators = {},
    --     section_separators = {},
    --     disabled_filetypes = {
    --       statusline = { "no-neck-pain", "aerial", "OverseerList", "OverseerOutput" },
    --       winbar = { "no-neck-pain", "aerial", "OverseerList", "OverseerOutput" },
    --     },
    --   },
    -- winbar = {
    -- lualine_a = {
    -- require("slidev-preview").winbar,
    -- },
    --   lualine_b = {
    --     {
    --       "filename",
    --       file_status = false,
    --       newfile_status = false,
    --       path = 2,
    --       fmt = fmt_filename,
    --     },
    --   },
    --   lualine_c = {
    --     { "diff", symbols = { added = " ", modified = " ", removed = " " } },
    --   },
    --   lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
    --   lualine_y = {
    --     { "filetype", icon_only = true },
    --   },
    --   lualine_z = {
    --     {
    --       "filename",
    --       newfile_status = true,
    --       symbols = {
    --         modified = " ",
    --         readonly = "󰌾 ",
    --       },
    --     },
    --   },
    -- },
    -- inactive_winbar = {
    --   lualine_a = {},
    --   lualine_b = {
    --     { "filename", file_status = false, newfile_status = false, path = 1, fmt = fmt_filename },
    --   },
    --   lualine_c = {
    --     { "diff", symbols = { added = " ", modified = " ", removed = " " } },
    --   },
    --   lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
    --   lualine_y = {
    --     { "filetype", icon_only = true },
    --   },
    --   lualine_z = {
    --     {
    --       "filename",
    --       newfile_status = true,
    --       symbols = {
    --         modified = " ",
    --         readonly = "󰌾 ",
    --       },
    --     },
    --   },
    -- },
    -- sections = {
    --   lualine_a = {},
    --   lualine_b = {
    --     { "overseer" },
    --   },
    --   lualine_c = {},
    --   lualine_x = { { "filename", path = 3 } },
    --   lualine_y = { "encoding", "fileformat" },
    --   lualine_z = {},
    -- },
    -- }
  end,
}
