-- return {
--   "https://github.com/stevearc/conform.nvim",
--   cmd = { "FormatDisable", "FormatEnable" },
--   event = "BufWritePre",
--   opts = function()
--     local function is_deno_project()
--       local cwd = vim.fn.getcwd()
--       return vim.fn.filereadable(cwd .. "/deno.json") == 1 or vim.fn.filereadable(cwd .. "/deno.jsonc") == 1
--     end
--
--     local web_formatter = function()
--       if is_deno_project() then
--         -- Denoプロジェクトの場合はLSP(denols)のフォーマットを使う (fallback)
--         return {}
--       end
--       return { "biome-check", "prettierd", stop_after_first = true }
--     end
--
--     -- lcocal markdown_formatter = function(bufnr)
--     --   local bufname = vim.api.nvim_buf_get_name(bufnr)
--     --   if bufname:match("/slides%.md$") then
--     --     return { "prettierd" }
--     --   end
--     --   return {}
--     -- end
--
--     vim.api.nvim_create_user_command("FormatDisable", function()
--       vim.b.disable_autoformat = true
--     end, { desc = "Disable autoformat-on-save for current buffer" })
--     vim.api.nvim_create_user_command("FormatEnable", function()
--       vim.b.disable_autoformat = false
--     end, { desc = "Re-enable autoformat-on-save for current buffer" })
--
--     return {
--       formatters_by_ft = {
--         lua = { "stylua" },
--         go = { "goimports" },
--         bash = { "shfmt" },
--         python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
--         zsh = { "shfmt" },
--         sql = { "sleek" },
--
--         -- Web
--         typescript = web_formatter,
--         javascript = web_formatter,
--         typescriptreact = web_formatter,
--         javascriptreact = web_formatter,
--         vue = web_formatter,
--         svelte = web_formatter,
--         json = web_formatter,
--         jsonc = web_formatter,
--         yaml = { "prettierd" },
--         html = web_formatter,
--         css = web_formatter,
--         scss = web_formatter,
--         less = web_formatter,
--
--         astro = { "prettierd" },
--       },
--       format_on_save = function(bufnr)
--         if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
--           return
--         end
--         local bufname = vim.api.nvim_buf_get_name(bufnr)
--         -- Obsidianのdata.jsonはフォーマット差分が生じるため除外するが、carnelian/data.jsonは対象にする
--         if bufname:match("/data%.json$") and not bufname:match("/carnelian/data%.json$") then
--           return nil --
--         end
--         format_on_save = {
--           timeout_ms = 1500,
--           -- conformで定義したformatterが存在しないならLSPのフォーマッターを使う
--           lsp_format = "fallback",
--         }
--       end,
--     }
--   end,
-- }

return {
  "https://github.com/stevearc/conform.nvim",
  cmd = { "FormatDisable", "FormatEnable" },
  event = "BufWritePre",

  opts = function()
    local function is_deno_project()
      local cwd = vim.fn.getcwd()

      return vim.fn.filereadable(cwd .. "/deno.json") == 1 or vim.fn.filereadable(cwd .. "/deno.jsonc") == 1
    end

    local web_formatter = function()
      if is_deno_project() then
        -- Denoプロジェクトの場合はLSP(denols)のフォーマットを使う
        return {}
      end

      return {
        "biome-check",
        "prettierd",
        stop_after_first = true,
      }
    end

    vim.api.nvim_create_user_command("FormatDisable", function()
      vim.b.disable_autoformat = true
    end, {
      desc = "Disable autoformat-on-save for current buffer",
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save for current buffer",
    })

    return {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        bash = { "shfmt" },
        python = {
          "ruff_organize_imports",
          "ruff_fix",
          "ruff_format",
        },
        zsh = { "shfmt" },
        sql = { "sleek" },

        -- Web
        typescript = web_formatter,
        javascript = web_formatter,
        typescriptreact = web_formatter,
        javascriptreact = web_formatter,
        vue = web_formatter,
        svelte = web_formatter,
        json = web_formatter,
        jsonc = web_formatter,
        yaml = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },

        astro = { "prettierd" },
      },

      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local bufname = vim.api.nvim_buf_get_name(bufnr)

        -- Obsidianのdata.jsonはフォーマット差分が生じるため除外
        -- carnelian/data.jsonは対象
        if bufname:match("/data%.json$") and not bufname:match("/carnelian/data%.json$") then
          return nil
        end

        return {
          timeout_ms = 1500,
          lsp_format = "fallback",
        }
      end,
    }
  end,
}
