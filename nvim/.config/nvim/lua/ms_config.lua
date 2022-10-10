ms_config = {}

local _opts = { noremap = true, silent = true }
local keymap = function(mode, key, mapping, opts)
    opts = opts or _opts
    vim.keymap.set(mode, key, mapping, opts)
end

ms_config.keys = {
    normal_mode = function(key, mapping, opts)
        keymap("n", key, mapping, opts)
    end,
    insert_mode = function(key, mapping, opts)
        keymap("i", key, mapping, opts)
    end,
    visual_mode = function(key, mapping, opts)
        keymap("v", key, mapping, opts)
    end,
    visual_block_mode = function(key, mapping, opts)
        keymap("x", key, mapping, opts)
    end,
    terminal_mode = function(key, mapping, opts)
        keymap("t", key, mapping, opts)
    end,
}

ms_config.global = function(key, value)
    vim.g[key] = value
end

ms_config.option = function(key, value)
    vim.opt[key] = value
end

ms_config.plugins = {
    dressing = { disabled = true },
    lsp_lines = { disabled = false },
    nvim_tree = { disabled = false },
    nvim_autopairs = { disabled = false },
    toggleterm = { disabled = false },
    aerial = { disabled = false },
    nvim_neoclip = { disabled = false },
    neoscroll = { disabled = false },
    hop = { disabled = false },
    leap = { disabled = false },
    comment = { disabled = false },
    telescope = { disabled = false },
    telescope_fzf_native = { disabled = false },
    telescope_media_files = { disabled = false },
    trouble = { disabled = false },
    nvim_navic = { disabled = false },
    lspsaga = { disabled = false },
    nvim_treesitter = { disabled = false },
    nvim_treesitter_playground = { disabled = true },
    nvim_treesitter_context = { disabled = false },
    nvim_ts_autotag = { disabled = false },
    gitsigns = { disabled = false },
    diffview = { disabled = false },
    vim_illuminate = { disabled = false },
    nvim_surround = { disabled = false },
    marks = { disabled = false },
    nvim_hlslens = { disabled = false },
    nvim_scrollbar = { disabled = false },
    nvim_colorizer = { disabled = false },
    lualine = { disabled = false },
    indent_blankline = { disabled = false },
    nvim_notify = { disabled = false },
    auto_session = { disabled = false },
    bufferline = { disabled = false },
    nvim_transparent = { disabled = false },
    fidget = { disabled = false },
    nvim_cmp = { disabled = false },
    null_ls = { disabled = false },
    mason = {
        disabled = false,
        lazy_load_cmds = {
            "Mason",
            "MasonInstall",
            "MasonInstallAll",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
    },
}
