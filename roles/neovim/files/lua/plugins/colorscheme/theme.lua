--- @type "catppuccin" | "tokyonight" | "rosepine"
local use_theme = "rosepine"

local theme = require("plugins.colorscheme." .. use_theme)
return vim.tbl_deep_extend("force", theme, { lazy = false })
