local LazyUtil = require("lazy.core.util")

---@class UtilCore
---@field keys util.keys
---@field filetypes util.filetypes
---@field icons util.icons
---@field plugins util.plugins
local M = {}

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
