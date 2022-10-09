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
    diffview = { disabled = false },
}
