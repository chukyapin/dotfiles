local vault_path = vim.fn.expand("~/Documents/Obsidian Vault/")

local vaults = {
  {
    name = "personal",
    path = vault_path,
  },
}

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Replace the above line with this if ypu only want load obsidian.nvim for markdown files in your vault:
  -- event = {
  --  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --  -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --  -- refer to `"h file-pattern` for more examples
  --  "BufReadPre path/to/my-vault/*.md",
  --  "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module "obsidian"
  ---@type obsidian.config
  opts = {
    workspaces = vaults,
    notes_subdir = "fleeting_note",
    -- see below for full list of options
  },
  daily_notes = {
    folder = "daily",
  },
}
