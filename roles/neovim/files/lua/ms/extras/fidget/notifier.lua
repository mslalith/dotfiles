---@class FidgetNotifier
---@field is_running boolean
---@field update fun(self: FidgetNotifier, msg: string)
---@field finish fun(self: FidgetNotifier)

local M = {}

---@type table<string, FidgetNotifier>
local tasks = {}

---@param key string
---@param group string
---@param title string
---@param message string
---@return FidgetNotifier
function M.get_or_create_task(key, group, title, message)
    if not key then
        vim.notify("key is required", vim.log.levels.ERROR, { title = "Fidget" })
    end

    if tasks[key] == nil then
        group = group or ""
        title = title or ""
        message = message or ""

        local progressHandle = require("fidget.progress").handle.create {
            title = title,
            message = message,
            percentage = nil,
            lsp_client = {
                name = group,
            },
            timeout = false,
        }

        ---@type FidgetNotifier
        tasks[key] = {
            key = key,
            is_running = false,
            update = function(msg)
                progressHandle:report { message = msg }
            end,
            finish = function()
                progressHandle:report { message = MsConfig.icons.ui.Done }
                progressHandle:finish()
                tasks[key] = nil
            end,
        }
    else
        tasks[key].is_running = true
    end

    return tasks[key]
end

return M
