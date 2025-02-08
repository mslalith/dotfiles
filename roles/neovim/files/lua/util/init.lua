local LazyUtil = require("lazy.core.util")

---@class util: UtilCore
---@field keys util.keys
local M = {}

setmetatable(M, {
    __index = function(t, k)
        if LazyUtil[k] then
            return LazyUtil[k]
        end
        t[k] = require("util." .. k)
        return t[k]
    end,
})

function M.global(key, value)
    vim.g[key] = value
end

function M.option(key, value)
    vim.opt[key] = value
end

return M
