local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

api.events.subscribe(api.events.Event.FileCreated, function(data)
    require("nvim-tree.actions.node.open-file").fn("tabnew", data.fname)
end)

nvim_tree.setup {
    create_in_closed_folder = true,
    respect_buf_cwd = true,
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local _width = screen_w * 0.7
                local _height = screen_h * 0.5
                local width = math.floor(_width)
                local height = math.floor(_height)
                local center_y = ((vim.opt.lines:get() - _height) / 2) - vim.opt.cmdheight:get()
                local center_x = (screen_w - _width) / 2
                return {
                    anchor = "NW",
                    relative = "editor",
                    border = "rounded",
                    row = center_y,
                    col = center_x,
                    width = width,
                    height = height,
                }
            end,
        },
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    renderer = {
        root_folder_modifier = ":~",
        highlight_git = true,
        add_trailing = true,
        group_empty = true,
        highlight_opened_files = "icon",
        indent_markers = {
            enable = true,
        },
        special_files = {
            ["Cargo.toml"] = true,
            Makefile = true,
            MAKEFILE = 1,
            ["README.md"] = true,
            ["readme.md"] = true,
        },
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
}

-- Will automatically close the tab/vim when nvim-tree is the last window in the tab
vim.cmd([[
  autocmd BufEnter * ++nested if winnr("$") == 1 && bufname() == "NvimTree_" . tabpagenr() | quit | endif
]])
