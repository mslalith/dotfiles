---@class util.plugins
local M = {}

---@param name string
---@return LazyPlugin
function M.get_plugin(name)
    return require("lazy.core.config").spec.plugins[name]
end

---@param name string
---@param path string?
---@return string
function M.get_plugin_path(name, path)
    local plugin = M.get_plugin(name)
    path = path and "/" .. path or ""
    return plugin and (plugin.dir .. path)
end

---@param plugin string
---@return boolean
function M.has(plugin)
    return M.get_plugin(plugin) ~= nil
end

---@return table
function M.stats()
    local stats = require("lazy").stats()
    local updates = require("lazy.manage.checker").updated
    return {
        count = stats.count,
        loaded = stats.loaded,
        startuptime = (math.floor(stats.startuptime * 100 + 0.5) / 100),
        updates = #updates,
    }
end

return M
