local M = {}

M.vscode_bordered = {
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

M.vertical = {
  layout = {
    backdrop = false,
    width = 0.7,
    min_width = 80,
    height = 0.8,
    min_height = 30,
    box = "vertical",
    border = "rounded",
    title = "{title} {live} {flags}",
    title_pos = "center",
    { win = "input", height = 1, border = "bottom" },
    { win = "list", border = "none", height = 0.3 },
    { win = "preview", title = "{preview}", height = 0.5, border = "top" },
  },
}

return M
