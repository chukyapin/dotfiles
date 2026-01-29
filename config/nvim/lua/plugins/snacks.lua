-- dashboard で picker を開いて移動する際に発生するチラツキを防止するlocal preventFlicker = function(handler)
local function restoreUi()
  local function restoreUi()
    if vim.api.nvim_tabpage_is_valid(vim.api.nvim_get_current_tabpage()) then
      vim.cmd([[:NoNeckPain]])
    end
    vim.cmd([[:BarbarEnable]])
  end

  local function waitForPickerClose()
    vim.defer_fn(function()
      local ok, pickers = pcall(Snacks.picker.get, { tab = true })
      if ok and pickers and #pickers > 0 then
        waitForPickerClose()
        return
      end
      restoreUi()
    end, 50)
  end

  vim.schedule(function()
    Snacks.bufdelete()
    vim.schedule(function()
      handler()
      waitForPickerClose()
    end)
  end)
end

local grepCurrentVueTag = function()
  if vim.fn.expand("%:e") ~= "vue" then
    vim.notify("Vueファイルでのみ実行できます", vim.log.levels.WARN)
    return
  end

  local name = vim.fn.expand("%:t:r")
  if name == "" then
    vim.notify("ファイル名を取得できません", vim.log.levels.WARN)
    return
  end

  local pattern = string.format("</?%s(\\s|/|>|$)", name)
  Snacks.picker.grep({
    search = pattern,
    live = false,
    need_search = false,
    args = { "--pcre2" },
  })
end

local git_recent = require("snacks.git_recent")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore start
	keys = {
		{ "<space>q", function() Snacks.bufdelete() end, silent = true },
		{ "<C-y>k", function() Snacks.picker.pickers() end, silent = true },
		{ "<C-y>e", function() Snacks.picker.explorer({ layout = "sidebar" }) end, silent = true },
		{ "<C-y>s", function() Snacks.picker.smart() end, silent = true },
		{ "<C-y>f", function() Snacks.picker.files() end, silent = true, desc = "find files" },
		{ "<C-y>g", function() Snacks.picker.grep() end, desc = "grep", silen = true },
		{ "<C-y>l", function() Snacks.picker.lines() end, desc = "lines", silent = true },

    {
      "<C-y><Space>f",
      mode = { "n", "i" },
      function()
        local curdir = vim.bo.filetype == "oil" and require("oil").get_current_dir() or vim.fn.expand("%:p:h")
        Snacks.picker.files({ dirs = { curdir } })
      end,
      silent = true
    },

    -- { "<C-y>e", mode = { "n", "i" }, function()
    --   git_recent.picker({max_commit_count = 30})
    -- end, silent = true },
    { "<C-y>r", mode = { "n", "i" }, function() Snacks.picker.recent() end, silent = true },
    { "<C-y>t", mode = { "n", "i" }, function() Snacks.picker.explorer() end, silent = true },
    { "<C-y>g", mode = { "n", "i" }, function() Snacks.picker.grep() end, silent = true },
    {
      "<C-y><Space>g",
      mode = { "n", "i" },
      function()
        local curdir = vim.bo.filetype == "oil" and require("oil").get_current_dir() or vim.fn.expand("%:p:h")
        Snacks.picker.grep({ dirs = { curdir } })
      end,
      silent = true
    },
    {
      "<C-y>v",
      mode = { "n", "i" },
      grepCurrentVueTag,
      silent = true,
    },
		{
			"<C-y>b",
			function()
				Snacks.picker.buffers({
					-- I always want my buffers picker to start in normal mode
					on_show = function()
						vim.cmd.stopinsert()
          end,
					finder = "buffers",
					format = "buffer",
					open = false,
					unloaded = true,
					current = true,
					sort_lastused = true,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
						list = { keys = { ["d"] = "bufdelete", silent = true } },
					},
					-- In case you want to override the layout for this keymap
					layout = "default",
				})
			end,
			desc = "[P]Snacks picker buffers",
		},
		{
			"<C-y>G",
			mode = { "n", "i" },
			function()
				local curdir = vim.bo.filetpickersype == "oil" and require("oil").get_current_dir() or vim.fn.expand("%::h")
				Snacks.picker.grep({ dirs = { curdir } })
			end,
			silent = true
		},
		{ "'g", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ ",,", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "'b", function() Snacks.picker.git_branches({ layout = "select" }) end,       desc = "Branches" },
		{ "'s", function() Snacks.picker.git_status() end,                              silent = true },
		{ "'l", function() Snacks.picker.git_log_line() end,                            silent = true },
    { "'d", function() Snacks.picker.git_diff() end, silent = true },
    { "'f", function() Snacks.picker.git_log_file() end, silent = true },
    { "<C-y>o", mode = { "n", "i" }, function() Snacks.picker.lsp_workspace_symbols() end, silent = true },
    { "<C-y>j", mode = { "n", "i" }, function() Snacks.picker.lsp_symbols() end, silent = true },
		-- { "<C-/>", mode = { "n", "i" }, function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
		-- { "<C-j>:", mode = { "n", "i" }, function() Snacks.picker.command_history() end, silent = true },
		-- { "<C-j>p", mode = { "n", "i" }, function() Snacks.picker.projects() end,        silent = true },
		-- --- @diagnostic disable-next-line: undefined-field todo_commentsはsnacks以外に定義があるため無視
		-- { "<C-j>m", mode = { "n", "i" }, function() Snacks.picker.todo_comments() end,   silent = true },
   },
  -- stylua: ignore end
  ---@type snacks.Config
  opts = {
    statuscolumn = { folds = { open = false } },
    notifier = { sort = { "added" } },
    scroll = { debug = false },
    explorer = {
      enable = true,
      hidden = true,
    },
    indent = {
      enabled = false,
    },
    image = {
      force = false,
      enabled = true,
      math = { enabled = true },
      doc = { inline = true, float = true },
    },
    dashboard = {
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 4,
          padding = 2,
        },
        { section = "keys", gap = 3, padding = 3 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 2,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -a -n5",
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              key = "n",
              icon = " ",
              height = 3,
              enabled = true,
            },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 5,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 5,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 7,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 2,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    picker = {
      main = {
        current = true,
      },
      actions = {
        insert_filename = function(picker)
          local item = picker:current()
          if item then
            local path = item.text or item.filename or item.path
            local filename = vim.fn.fnamemodify(path, ":t")
            vim.schedule(function()
              vim.api.nvim_put({ filename }, "", true, true)
            end)
            picker:close()
          end
        end,
      },
      sources = {
        git_recent = git_recent.source_config(),
        git_status = { layout = { layout = { width = 180 } } },
        git_diff = { layout = { layout = { width = 180 } } },
        git_log_file = { layout = { layout = { width = 180 } } },
        git_log_line = { layout = { layout = { width = 180 } } },
        lines = {
          sort = { fields = { "idx", "score:desc" } },
          matcher = { fuzzy = false },
          ---@diagnostic disable-next-line: assign-type-mismatch 普通にプレビュー
          layout = { preview = true },
        },
        recent = {
          sort = { fields = { "idx", "score:desc" } },
          matcher = { fuzzy = false },
          hidden = true,
          -- open = true,
        },
        files = {
          -- open = true,
          hidden = true,
        },
        -- command_history = {
        --   sort = { fields = { "idx", "score:desc" } },
        --   matcher = { fuzzy = false },
        -- },
        grep = {
          hidden = true,
        },
        select = {
          kinds = {
            sidekick_cli = {
              layout = { preset = "vscode" },
            },
            sidekick_prompt = {
              layout = { preset = "vscode" },
            },
          },
        },
        explorer = {
          -- focus = "input",
          auto_close = true,
          matcher = { sort_empty = false },
          hidden = true,
          -- open = true,
          win = {
            list = {
              keys = {
                --                 ["<c-]>"] = { "toggle_live", mode = { "i", "n" } },
                ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["|"] = { "edit_vsplit", mode = { "i", "n" } },
                ["<C-w>t"] = { "tab", mode = { "i", "n" } },
                -- TODO: そのままoil.nvimで対象を開く
                -- ["<C-o>"] = { mode = { "i", "n" }, },
              },
            },
          },
          ---@diagnostic disable-next-line: assign-type-mismatch 普通にプレビュー
          layout = { preview = true },
        },
      },
      win = {
        input = {
          keys = {
            ["<esc>"] = { "close", mode = { "i", "n" } },
            ["<C-o>"] = { "qflist", mode = { "i", "n" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<C-]>"] = { "toggle_live", mode = { "i", "n" } },
            ["|"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-w>t"] = { "tab", mode = { "i", "n" } },
            ["<C-j>"] = { "history_forward", mode = { "i", "n" } },
            ["<C-k>"] = { "history_back", mode = { "i", "n" } },
            -- ["<C-h>"] = { "toggle_help_input", mode = { "i", "n" } },
            ["<D-CR>"] = { "insert_filename", mode = { "i", "n" } },
            -- TODO: 正規表現切り替えやignoredはなぜか効かない...
          },
        },
      },
      layout = {
        cycle = true,
        preset = "vertical",
        layout = {
          backdrop = false,
          width = 120,
          min_width = 80,
          height = 0.9,
          min_height = 30,
          box = "vertical",
          border = "rounded",
          title = "{title} {live} {flags}",
          Title_pos = "center",
          { win = "preview", title = "{preview}", height = 0.5, border = "bottom" },
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
      },
      formatters = {
        file = {
          filename_first = true,
          truncate = 100,
        },
      },
      previewers = {
        diff = {
          style = "terminal",
          -- NOTE: side-by-sideにすると横幅がおかしくなるので諦める
        },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#ba55d3" })
        git_recent.setup_highlights()
      end,
    })
  end,
}
