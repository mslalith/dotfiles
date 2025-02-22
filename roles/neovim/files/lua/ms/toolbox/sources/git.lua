---@class ms.toolbox.sources.git : ms.toolbox.source.Source
local M = require("ms.toolbox.sources.source"):new()

local toolbox = require("ms.toolbox")

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "New Branch",
        group = "Git",
        execute = function()
            Snacks.input.input({
                prompt = "New Branch Name",
            }, function(name)
                if not name then
                    return
                end
                if name == "" then
                    toolbox.notify_error("Branch name cannot be empty")
                    return
                end

                local check_branch_cmd = { "git", "branch", "--list", name }
                Snacks.picker.util.cmd(check_branch_cmd, function(data)
                    if data[1] ~= "" then
                        toolbox.notify_error("Branch already exists")
                        return
                    end

                    local create_branch_cmd = { "git", "checkout", "-b", name }
                    Snacks.picker.util.cmd(create_branch_cmd, function()
                        toolbox.notify_info("Branch created")
                    end)
                end)
            end)
        end,
    },
    {
        name = "Git Fetch",
        group = "Git",
        execute = function()
            M.run_task {
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
        group = "Git",
        execute = function()
            M.run_task {
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
        group = "Git",
        execute = function()
            M.run_task {
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
