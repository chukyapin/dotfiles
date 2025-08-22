local vue_language_server_path = os.getenv("HOME")
  .. "/.local/share/mise/installs/npm-vue-language-server/latest/lib/node_modules/@vue/language-server"
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

return {
  -- root_markersはデフォルトだと .git も含まれており、Denoプロジェクトでも有効になってしまうのを避けるため設定し直している
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
  workspace_required = true,

  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
