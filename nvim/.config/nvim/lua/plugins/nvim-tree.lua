local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup {
  create_in_closed_folder = true,
  respect_buf_cwd = true,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
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
    }
  }
}

-- Will automatically close the tab/vim when nvim-tree is the last window in the tab
vim.cmd [[
  autocmd BufEnter * ++nested if winnr("$") == 1 && bufname() == "NvimTree_" . tabpagenr() | quit | endif
]]

