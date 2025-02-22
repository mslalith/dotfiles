---@class ms.toolbox.sources.git
local M = {}

local group_name = "git"

local function notify(key, msg)
    local fidget = require("fidget")
    fidget.notify(msg, nil, { group = group_name, key = key })
end

---@type vim.SystemObj|nil
local git_fetch_sys_obj = nil
---@type vim.SystemObj|nil
local git_status_sys_obj = nil

local function git_fetch()
    if git_fetch_sys_obj ~= nil then
        return
    end

    notify("git_fetch", "Fetching")
    git_fetch_sys_obj = vim.system({ "git", "fetch" }, { text = true }, function(obj)
        git_fetch_sys_obj = nil
        if obj.code ~= 0 then
            vim.notify("Git fetch failed")
        end
    end)
end

local function git_status()
    if git_status_sys_obj ~= nil then
        return
    end

    notify("git_status", "Fetching status")
    git_status_sys_obj = vim.system({ "git", "status" }, { text = true }, function(obj)
        git_status_sys_obj = nil
        if obj.code ~= 0 then
            vim.notify("Git status failed")
        end
    end)
end

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Git Fetch",
        execute = function()
            git_fetch()
        end,
    },
    {
        name = "Git Status",
        execute = function()
            git_status()
        end,
    },
}

return M
