---@class ms.toolbox.Sources
---@field pickers ms.toolbox.sources.pickers
---@field toggles ms.toolbox.sources.toggles
---@field notifications ms.toolbox.sources.notifications
---@field git ms.toolbox.sources.git

---@type ms.toolbox.Sources
return {
    pickers = require("ms.toolbox.sources.pickers"),
    toggles = require("ms.toolbox.sources.toggles"),
    notifications = require("ms.toolbox.sources.notifications"),
    git = require("ms.toolbox.sources.git"),
}
