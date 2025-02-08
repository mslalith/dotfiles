local LazyUtil = require("lazy.core.util")

---@class util: UtilCore
---@field keys util.keys
local M = {}

M.filetypes = {
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

function M.is_git_repo()
    vim.fn.system("git rev-parse " .. vim.fn.expand("%:p:h"))
    return vim.v.shell_error == 0
end

setmetatable(M, {
    __index = function(t, k)
        if LazyUtil[k] then
            return LazyUtil[k]
        end
        t[k] = require("util." .. k)
        return t[k]
    end,
})

return M
