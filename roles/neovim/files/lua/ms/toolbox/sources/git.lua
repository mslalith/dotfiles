---@class ms.toolbox.sources.git
local M = {}

---@param key string
---@param title string
---@param message string
---@return FidgetNotifier
local function get_or_create_task(key, title, message)
    return require("ms.extras.fidget.notifier").get_or_create_task(key, "Git", title, message)
end

---@param cmd string[]
---@param key string
---@param title string
---@param message string
---@param failure? fun(obj: vim.SystemCompleted): boolean
local function run_task_if_required(cmd, key, title, message, failure)
    if not key then
        require("ms.toolbox").notify_error("key is required")
    end
    if not title then
        require("ms.toolbox").notify_error("title is required")
    end

    local task = get_or_create_task(key, title, message)
    if task.is_running then
        return
    end

    failure = failure or function(obj)
        return obj.code ~= 0
    end

    vim.system(cmd, { text = true }, function(obj)
        task:finish()
        if failure(obj) then
            require("ms.toolbox").notify_error(title .. " failed")
        end
    end)
end

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Git Fetch",
        execute = function()
            run_task_if_required({ "git", "fetch" }, "git_fetch", "Git Fetch", "fetching")
        end,
    },
    {
        name = "Git Pull",
        execute = function()
            run_task_if_required({ "git", "pull" }, "git_pull", "Git Pull", "pulling")
        end,
    },
    {
        name = "Git Push",
        execute = function()
            run_task_if_required({ "git", "push" }, "git_push", "Git Push", "pushing")
        end,
    },
}

return M
