local LazyUtil = require("lazy.core.util")

---@class UtilCore
---@field keys util.keys
---@field filetypes util.filetypes
---@field icons util.icons
---@field plugins util.plugins
---@field snacks util.snacks
local M = {}

---@return boolean
function M.is_git_repo()
    vim.fn.system("git rev-parse " .. vim.fn.expand("%:p:h"))
    return vim.v.shell_error == 0
end

---@return string
function M.nvim_version()
    local version = vim.version()
    local v = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
    -- if version.prerelease ~= nil then v = v .. '-' .. version.prerelease end
    return v
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
