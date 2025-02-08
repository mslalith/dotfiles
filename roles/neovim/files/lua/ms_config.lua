ms = {}

local keymap = function(mode, key, mapping, opts)
    local _opts = { noremap = true, silent = true }
    opts = opts or _opts
    vim.keymap.set(mode, key, mapping, opts)
end

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
