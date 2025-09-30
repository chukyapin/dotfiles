---- dashboard で picker を開いて移動する際に発生するチラツキを防止する
local preventFlicker = function(handler)
  vim.schedule(function()
    Snacks.bufdelete()
  end)
  vim.schedule(function()
    -- ここの順番が逆だとno-neck-painがエラーになる
    vim.cmd([[:NoNeckPain]])
    vim.cmd([[:BarbarEnable]])
  end)
  vim.schedule(function()
    handler()
  end)
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
	-- stylua: ignore start
	keys = {

		{ "<Space>q", mode = { "n", }, function() Snacks.bufdelete() end,                             silent = true },
		{ "<Space>k", mode = { "n", }, function() Snacks.picker.keymaps() end,                        desc = "Keymaps" },
		{ "<C-j>e", mode = { "n", }, function() Snacks.picker.explorer({ layout = "sidebar" }) end, silent = true },
		{ "<C-j>r",       mode = { "n", }, function() Snacks.picker.recent() end,                         silent = true },
		{ "<C-j>s",       mode = { "n", }, function() Snacks.picker.smart() end,                          silent = true },
		{ "<C-j>f",       mode = { "n", }, function() Snacks.picker.files() end,                          desc = "Find Files" },
		{ "<C-j>g",       mode = { "n", }, function() Snacks.picker.grep() end,                           desc = "Grep" },
		{ "<C-j>l",    mode = { "n", "i" }, function() Snacks.picker.lines() end,                                   desc = "Lines",           silent = true },
		{ "<C-j>d",    mode = { "n", "i" }, function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
		{
			"<C-j>b",
			function()
				Snacks.picker.buffers({
					-- I always want my buffers picker to start in normal mode
					on_show = function()
						vim.cmd.stopinsert()
					end,
					finder = "buffers",
					format = "buffer",
					hidden = false,
					unloaded = true,
					current = true,
					sort_lastused = true,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
						list = { keys = { ["d"] = "bufdelete" } },
					},
					-- In case you want to override the layout for this keymap
					layout = "ivy",
				})
			end,
			desc = "[P]Snacks picker buffers",
		},
		{
			"<C-j>G",
			mode = { "n", "i" },
			function()
				local curdir = vim.bo.filetype == "oil" and require("oil").get_current_dir() or vim.fn.expand("%:p:h")
				Snacks.picker.grep({ dirs = { curdir } })
			end,
			silent = true
		},
		{ "'g",       mode = { "n", }, function() Snacks.lazygit() end,                               desc = "Lazygit" },
		-- { "<C-,>", mode = { "n", "i" }, function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		-- { "<C-/>", mode = { "n", "i" }, function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
		{ "'b",    mode = { "n", "i" }, function() Snacks.picker.git_branches({ layout = "select" }) end,       desc = "Branches" },
		-- { "<C-j>:", mode = { "n", "i" }, function() Snacks.picker.command_history() end, silent = true },
		{ "'s",    mode = { "n", "i" }, function() Snacks.picker.git_status() end,                              silent = true },
		{ "'l",    mode = { "n", "i" }, function() Snacks.picker.git_log_line() end,                            silent = true },
		-- { "<C-j>j", mode = { "n", "i" }, function() Snacks.picker.resume() end,          silent = true },
		-- { "<C-j>k", mode = { "n", "i" }, function() Snacks.picker.pickers() end,         silent = true },
		-- { "<C-j>p", mode = { "n", "i" }, function() Snacks.picker.projects() end,        silent = true },
		-- --- @diagnostic disable-next-line: undefined-field todo_commentsはsnacks以外に定義があるため無視
		-- { "<C-j>m", mode = { "n", "i" }, function() Snacks.picker.todo_comments() end,   silent = true },
	},
  -- stylua: ignore end
  ---@type snacks.Config
  opts = {
    image = {
      doc = {
        inline = false,
      },
    },
    dashboard = {
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 3, padding = 10 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            -- {
            --   title = "Notifications",
            --   cmd = "gh notify -s -a -n5",
            --   action = function()
            --     vim.ui.open("https://github.com/notifications")
            --   end,
            --   key = "n",
            --   icon = " ",
            --   height = 5,
            --   enabled = true,
            -- },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
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
        },
        files = {
          hidden = true,
        },
        command_history = {
          sort = { fields = { "idx", "score:desc" } },
          matcher = { fuzzy = false },
        },
        explorer = {
          -- focus = "input",
          auto_close = true,
          matcher = { sort_empty = false },
          hidden = true,
          win = {
            list = {
              keys = {
                ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
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
            ["<c-o>"] = { "qflist", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-]>"] = { "toggle_live", mode = { "i", "n" } },
            ["<C-v>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-w>t"] = { "tab", mode = { "i", "n" } },
            -- ["<C-j>"] = { "history_forward", mode = { "i", "n" } },
            -- ["<C-k>"] = { "history_back", mode = { "i", "n" } },
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
          title_pos = "center",
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
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "LineNr" })
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#ba55d3" })
      end,
    })
  end,
}
