--- @type "catppuccin" | "tokyonight" | "rosepine" | "kanagawa"
local use_theme = "catppuccin"

local theme = require("plugins.colorscheme." .. use_theme)
return vim.tbl_deep_extend("force", theme, { lazy = false })
