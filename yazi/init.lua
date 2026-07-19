require("zoxide"):setup({
	update_db = true,
})

require("session"):setup({
	sync_yanked = true,
})

require("git"):setup()

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("folder-rules"):setup()

-- `plugins/bunny-private.yazi/main.lua` に設定する
require("bunny"):setup({
	hops = {
		{ key = "h", path = "~" },
		{ key = "t", path = "/tmp" },
		{ key = "n", path = "~/develop/github.com/chukyapin/zettelkasten/Literature_Note/農業日誌/" },
		{ key = "D", path = "~/Desktop", desc = "Desktop" },
		{ key = "d", path = "~/Documents", desc = "Documents" },
		{ key = "c", path = "~/.config", desc = "Config files" },
		{ key = "i", path = "~/Library/Mobile Documents/com~apple~CloudDocs/image" },
	},
})
