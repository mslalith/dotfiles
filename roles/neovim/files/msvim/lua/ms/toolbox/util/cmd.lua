---@class toolbox.util.Cmd
local M = {}

---@class toolbox.util.cmd.RunOpts
---@field cmd string[]
---@field group string
---@field key string
---@field title string
---@field message string
---@field on_success? fun()
---@field on_failure? fun()

---@param opts toolbox.util.cmd.RunOpts
function M.run_with_progress(opts)
    if not opts.group then
        Toolbox.notifier.error("group is required")
    end
    if not opts.key then
        Toolbox.notifier.error("key is required")
    end
    if not opts.title then
        Toolbox.notifier.error("title is required")
    end

    local task = require("ms.extras.fidget.notifier").get_or_create_task(opts.key, opts.group, opts.title, opts.message)
    if task.is_running then
        return
    end

    M.run(opts.cmd, function()
        if opts.on_success then
            opts.on_success()
        end
        task:finish()
    end, function()
        if opts.on_failure then
            opts.on_failure()
        end
        task:finish()
    end)
end

---@param cmd string[]
---@param callback fun(output: string[])
---@param on_error? fun(code: number)
function M.run(cmd, callback, on_error)
    vim.system(cmd, { text = true }, function(obj)
        if obj.code ~= 0 then
            vim.notify(
                ("Command execution failed\ncmd: %s\nFailed with code `%d`:\n\nOutput:\n%s"):format(
                    table.concat(cmd, " "),
                    obj.code,
                    vim.trim(obj.stderr)
                ),
                vim.log.levels.ERROR
            )
            if on_error then
                on_error(obj.code)
            end
            return
        end

        local output = vim.split(obj.stdout, "\n")
        callback(output)
    end)
end

---@param cmd string[]
---@param opts? table
---@param on_error? fun(code: number)
---@return string[]
function M.run_sync(cmd, opts, on_error)
    opts = opts or {}
    if opts.notify_failure == nil then
        opts.notify_failure = true
    end
    local obj = vim.system(cmd, { text = true }):wait()

    if obj.code ~= 0 and opts.notify_failure then
        vim.notify(
            ("Command execution failed\ncmd: %s\nFailed with code `%d`:\n\nOutput:\n%s"):format(
                table.concat(cmd, " "),
                obj.code,
                vim.trim(obj.stderr)
            ),
            vim.log.levels.ERROR
        )
        if on_error then
            on_error(obj.code)
        end
        return {}
    end

    local output = vim.split(obj.stdout, "\n")
    return output
end

return M
