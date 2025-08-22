-- return {
--   on_init = function(client)
--     if client.workspace_folders then
--       local path = client.workspace_folders[1].name
--       if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
--         return
--       end
--     end
--
--     client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
--       runtime = {
--         version = "LuaJIT",
--       },
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME,
--         },
--       },
--       hint = {
--         enable = true,
--         setType = false,
--         paramType = true,
--         paramName = "Disable",
--         arrayIndex = "Disable",
--         semicolon = "Disable",
--       },
--       doc = {
--         privateName = { "^_" },
--       },
--       type = {
--         castNumberToInteger = true,
--       },
--       diagnostics = {
--         disable = { "incomplete-signature-doc", "trailing-space" },
--         -- enable = false,
--         groupSeverity = {
--           strong = "Warning",
--           strict = "Warning",
--         },
--         groupFileStatus = {
--           ["ambiguity"] = "Opened",
--           ["await"] = "Opened",
--           ["codestyle"] = "None",
--           ["duplicate"] = "Opened",
--           ["global"] = "Opened",
--           ["luadoc"] = "Opened",
--           ["redefined"] = "Opened",
--           ["strict"] = "Opened",
--           ["strong"] = "Opened",
--           ["type-check"] = "Opened",
--           ["unbalanced"] = "Opened",
--           ["unused"] = "Opened",
--         },
--         unusedLocalExclude = { "_*" },
--       },
--       format = {
--         enable = false,
--         defaultConfig = {
--           indent_style = "space",
--           indent_size = "2",
--           continuation_indent_size = "2",
--         },
--       },
--     })
--   end,
--   settings = {
--     Lua = {},
--   },
-- }
return {
  settings = {
    Lua = {
      misc = {
        -- parameters = { "--loglevel=trace" },
      },
      hover = { expandAlias = false },
      type = {
        castNumberToInteger = true,
        inferParamType = true,
      },
      diagnostics = {
        disable = { "incomplete-signature-doc", "trailing-space" },
        -- enable = false,
        groupSeverity = {
          strong = "Warning",
          strict = "Warning",
        },
        groupFileStatus = {
          ["ambiguity"] = "Opened",
          ["await"] = "Opened",
          ["codestyle"] = "None",
          ["duplicate"] = "Opened",
          ["global"] = "Opened",
          ["luadoc"] = "Opened",
          ["redefined"] = "Opened",
          ["strict"] = "Opened",
          ["strong"] = "Opened",
          ["type-check"] = "Opened",
          ["unbalanced"] = "Opened",
          ["unused"] = "Opened",
        },
        unusedLocalExclude = { "_*" },
      },
    },
  },
}
