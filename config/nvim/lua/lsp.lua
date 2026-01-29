-- LSPアタッチされたあとの設定
-- TODO: 分離できる? group指定はいる?
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    if vim.bo[ev.buf].filetype == "markdown" then
      return
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    -- 定義に移動 (Lspsaga goto_definition は期待しない定義に飛んでしまうことがある)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "v<C-]>", function()
      vim.cmd([[ vsplit ]])
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "s<C-]>", function()
      vim.cmd([[ split ]])
      vim.lsp.buf.definition()
    end, opts)
    -- 定義をホバー
    -- vim.keymap.set("n", "<A-s>", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "<A-s>", "<cmd>Lspsaga hover_doc<CR>", opts)
    -- 実装へ移動
    vim.keymap.set("n", "<C-y>i", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- 実装をホバー
    vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- 型の実装をホバー
    vim.keymap.set("n", "<A-i>", "<cmd>Lspsaga peek_type_definition<CR>", opts)
    -- 呼び出し元の表示
    vim.keymap.set("n", "<C-y>u", "<cmd>Lspsaga finder ref<CR>", opts)
    -- リネーム
    vim.keymap.set({ "n", "i" }, "<S-A-r>", "<cmd>Lspsaga rename<CR>", opts)
    -- ファイルリネーム
    vim.keymap.set("n", "<C-S>r", vim.lsp.buf.rename, opts)
    -- Code action
    vim.keymap.set({ "n", "i" }, "<space><tab>", "<cmd>Lspsaga code_action<CR>", opts)

    -- 次の診断へ移動
    vim.keymap.set("n", "<C-f15>", function()
      vim.diagnostic.jump({ float = false, count = 1 })
    end, opts)
    -- 前の診断へ移動
    vim.keymap.set("n", "<C-f16>", function()
      vim.diagnostic.jump({ float = false, count = -1 })
    end, opts)
    vim.keymap.set("n", "<A-f>", function()
      vim.diagnostic.open_float({
        scope = "cursor",
      })
    end, opts)

    -- LSP再起動
    vim.keymap.set("n", "<Space><Space>r", "<cmd>LspRestart<CR>", opts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end

    -- inlay hint
    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable()
    end

    -- 深刻度が高い方を優先して表示
    vim.diagnostic.config({ severity_sort = true })

    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.INFO] = signs.Info,
          [vim.diagnostic.severity.HINT] = signs.Hint,
        },
      },
    })
  end,
})
if not vim.g.vscode then
  vim.lsp.enable({
    "bashls",
    "biome",
    "copilot-language-server",
    "cssls",
    "denols",
    "efm",
    "emmet_language_server",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "oxfmt",
    "pyright",
    -- "basedpyright",
    "ruff",
    "sqls",
    "svelte",
    "tailwindcss",
    "ty",
    -- "typst",
    "tinymist",
    "vtsls",
    "vue_ls",
    "yamlls",
  })
end
