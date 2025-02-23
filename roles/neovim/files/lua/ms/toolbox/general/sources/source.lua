---@class ms.toolbox.source.SourceOptions
---@field cmd string[]
---@field group string
---@field key string
---@field title string
---@field message string
---@field failure? fun(obj: vim.SystemCompleted): boolean

---@class ms.toolbox.source.Source
local M = {}

---@return ms.toolbox.source.Source
function M:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---@param opts ms.toolbox.source.SourceOptions
function M.run_task(opts)
    if not opts.group then
        Toolbox.notify_error("group is required")
    end
    if not opts.key then
        Toolbox.notify_error("key is required")
    end
    if not opts.title then
        Toolbox.notify_error("title is required")
    end

    local task = require("ms.extras.fidget.notifier").get_or_create_task(opts.key, opts.group, opts.title, opts.message)
    if task.is_running then
        return
    end

    opts.failure = opts.failure or function(obj)
        return obj.code ~= 0
    end

    vim.system(opts.cmd, { text = true }, function(obj)
        task:finish()
        if opts.failure(obj) then
            Toolbox.notify_error(opts.title .. " failed")
        end
    end)
end

return M
