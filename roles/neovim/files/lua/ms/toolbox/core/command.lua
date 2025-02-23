local M = {}

---@class ms.toolbox.Command
---@field name string
---@field group string
---@field execute fun()

---@class ms.toolbox.finder.Item : snacks.picker.finder.Item
---@field idx number
---@field group string
---@field name string
---@field divider boolean
---@field execute fun()

---@param commands ms.toolbox.Command[]
---@return ms.toolbox.finder.Item[]
function M.get_finder_items(commands)
    local items = {}
    for i, v in ipairs(commands) do
        local item = {
            idx = i,
            group = v.group,
            text = v.name,
            name = v.name,
            execute = v.execute,
            divider = v.name == "-",
        }
        table.insert(items, item)
    end
    return items
end

return M
