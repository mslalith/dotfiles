---@class toolbox.util.Cmd
local M = {}

---@class toolbox.util.cmd.RunOpts
---@field cmd string[]
---@field group string
---@field key string
---@field title string
---@field message string

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
        task:finish()
    end, function()
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

return M
