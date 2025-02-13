---@class util.snacks
local M = {}

M.layout_vscode_bordered = {
    preview = false,
    layout = {
        backdrop = false,
        row = 2,
        width = 0.4,
        min_width = 80,
        height = 0.4,
        border = "none",
        box = "vertical",
        { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
        { win = "list", border = "rounded" },
        { win = "preview", title = "{preview}", border = "rounded" },
    },
}

return M
