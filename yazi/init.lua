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

require("bunny"):setup({
	hops = {
		{ key = "h", path = "~", desc = "Home" },
		{ key = "t", path = "/tmp", desc = "tmp" },
		{
			key = "n",
			path = "~/develop/github.com/chukyapin/zettelkasten/Literature_Note/daily/",
			desc = "Daily",
		},
		{ key = "D", path = "~/Desktop", desc = "Desktop" },
		{ key = "d", path = "~/develop/github.com/chukyapin/dotfiles/", desc = "dotfiles" },
		{ key = "c", path = "~/.config", desc = "Config files" },
		{ key = "z", path = "~/develop/github.com/chukyapin/zettelkasten/", desc = "zettelkasten" },
		{
			key = "i",
			path = "~/Library/Mobile Documents/com~apple~CloudDocs/image",
			desc = "iCloud images",
		},
	},

	desc_strategy = "path",
	ephemeral = true,
	tabs = true,
	notify = false,
	fuzzy_cmd = "fzf",
})
