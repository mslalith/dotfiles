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

---@param tbl table
---@param insert_tbl table
---@return table
function M.tbl_insert(tbl, insert_tbl)
    for _, v in ipairs(insert_tbl) do
        table.insert(tbl, v)
    end
    return tbl
end

---@param tbls table[]
---@return table
function M.tbl_merge(tbls)
    local list = {}

    for _, tbl in ipairs(tbls) do
        vim.notify(vim.inspect(tbl))
        for _, v in ipairs(tbl) do
            table.insert(list, v)
        end
    end

    return list
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
