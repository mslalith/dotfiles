---@class ms.toolbox.sources.git
local M = {}

---@param key string
---@param title string
---@param message string
---@return FidgetNotifier
local function get_or_create_task(key, title, message)
    return require("ms.extras.fidget.notifier").get_or_create_task(key, "Git", title, message)
end

local function git_fetch()
    local git_fetch_task = get_or_create_task("git_fetch", "Git Fetch", "fetching")
    if git_fetch_task.is_running then
        return
    end

    vim.system({ "git", "fetch" }, { text = true }, function(obj)
        git_fetch_task:finish()
        if obj.code ~= 0 then
            require("ms.toolbox").notify_error("Git fetch failed")
        end
    end)
end

local function git_pull()
    local git_pull_task = get_or_create_task("git_pull", "Git Pull", "pulling")
    if git_pull_task.is_running then
        return
    end

    vim.system({ "git", "pull" }, { text = true }, function(obj)
        git_pull_task:finish()
        if obj.code ~= 0 then
            require("ms.toolbox").notify_error("Git pull failed")
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
        name = "Git Pull",
        execute = function()
            git_pull()
        end,
    },
}

return M
