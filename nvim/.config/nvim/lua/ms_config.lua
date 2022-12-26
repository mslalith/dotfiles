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
