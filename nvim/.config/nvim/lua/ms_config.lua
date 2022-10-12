ms = {}

local _opts = { noremap = true, silent = true }
local keymap = function(mode, key, mapping, opts)
    opts = opts or _opts
    vim.keymap.set(mode, key, mapping, opts)
end

ms.keys = {
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

ms.global = function(key, value)
    vim.g[key] = value
end

ms.option = function(key, value)
    vim.opt[key] = value
end

ms.is_git_repo = function()
    vim.fn.system("git rev-parse " .. vim.fn.expand("%:p:h"))
    return vim.v.shell_error == 0
end

ms.filetypes = {
    web_frontend = {
        "html",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    rust = { "rust" },
}

ms.plugins = {
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
    nvim_treesitter_playground = { disabled = false },
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

ms.disable_distribution_plugins = function()
    ms.global("loaded_gzip", 1)
    ms.global("loaded_tar", 1)
    ms.global("loaded_tarPlugin", 1)
    ms.global("loaded_zip", 1)
    ms.global("loaded_zipPlugin", 1)
    ms.global("loaded_getscript", 1)
    ms.global("loaded_getscriptPlugin", 1)
    ms.global("loaded_vimball", 1)
    ms.global("loaded_vimballPlugin", 1)
    ms.global("loaded_matchit", 1)
    ms.global("loaded_matchparen", 1)
    ms.global("loaded_2html_plugin", 1)
    ms.global("loaded_logiPat", 1)
    ms.global("loaded_rrhelper", 1)
    ms.global("loaded_netrw", 1)
    ms.global("loaded_netrwPlugin", 1)
    ms.global("loaded_netrwSettings", 1)
    ms.global("loaded_netrwFileHandlers", 1)
end
