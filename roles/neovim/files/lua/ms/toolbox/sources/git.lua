---@class ms.toolbox.sources.git : ms.toolbox.source.Source
local M = require("ms.toolbox.sources.source"):new()

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "Git Fetch",
        execute = function()
            M:run_task {
                cmd = { "git", "fetch" },
                group = "Git",
                key = "git_fetch",
                title = "Git Fetch",
                message = "fetching",
            }
        end,
    },
    {
        name = "Git Pull",
        execute = function()
            M:run_task {
                cmd = { "git", "pull" },
                group = "Git",
                key = "git_pull",
                title = "Git Pull",
                message = "pulling",
            }
        end,
    },
    {
        name = "Git Push",
        execute = function()
            M:run_task {
                cmd = { "git", "push" },
                group = "Git",
                key = "git_push",
                title = "Git Push",
                message = "pushing",
            }
        end,
    },
}

return M
