local M = {}

local group_name = "git"

local function notify(key, msg)
    local fidget = require("fidget")
    fidget.notify(msg, nil, { group = group_name, key = key })
end

---@type vim.SystemObj|nil
local git_fetch = nil
---@type vim.SystemObj|nil
local git_status = nil

function M.git_fetch()
    if git_fetch ~= nil then
        return
    end

    notify("git_fetch", "Fetching")
    -- vim.notify("Fetching")
    git_fetch = vim.system({ "git", "fetch" }, { text = true }, function(obj)
        git_fetch = nil
        notify("git_fetch", vim.inspect(obj))
        vim.notify(vim.v.shell_error .. "")
        -- vim.notify(vim.inspect(obj))
    end)
end

function M.git_status()
    if git_status ~= nil then
        return
    end

    notify("git_status", "Fetching status")
    -- vim.notify("Fetching")
    git_status = vim.system({ "git", "status" }, { text = true }, function(obj)
        git_status = nil
        notify("git_status", vim.inspect(obj))
        vim.notify(vim.v.shell_error .. "")
        -- vim.notify(vim.inspect(obj))
    end)
end

return M
