local function setup()
	require("bunny"):setup({
		hops = {
			{ key = "/", path = "/" },
			{ key = "h", path = "~", desc = "Home directory" },
			{ key = "d", path = "~/Developments/", desc = "Developments" },
			{ key = "c", path = "~/.config", desc = "Config files" },
			{ key = "i", path = "~/Library/Mobile Documents/com~apple~CloudDocs/image", desc = "iCloud/image" },
		},
	})
end

return { setup = setup }
