---@class toolbox
---@field check_status toolbox.picker.git.CheckStatus
local M = {}

setmetatable(M, {
    __index = function(t, k)
        t[k] = require("ms.toolbox.git." .. k)
        return t[k]
    end,
})

M.picker_key = "toolbox_git"

-- Git cli commands
local current_branch_cmd = { "git", "rev-parse", "--abbrev-ref", "HEAD" }
local local_branches_cmd = { "git", "for-each-ref", "--format='%(refname:short)'", "refs/heads/" }

---@type ms.toolbox.Command[]
M.cmds = {
    {
        name = "New Branch",
        group = "Git",
        execute = function()
            Toolbox.actions.git.create_branch()
        end,
    },
    {
        name = "Commit",
        group = "Git",
        execute = function()
            Toolbox.actions.git.commit()
        end,
    },
    {
        name = "Fetch",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run_with_progress {
                cmd = { "git", "fetch" },
                group = "Git",
                key = "git_fetch",
                title = "Git Fetch",
                message = "fetching",
            }
        end,
    },
    {
        name = "Pull",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run_with_progress {
                cmd = { "git", "pull" },
                group = "Git",
                key = "git_pull",
                title = "Git Pull",
                message = "pulling",
            }
        end,
    },
    {
        name = "Push",
        group = "Git",
        execute = function()
            Toolbox.util.cmd.run_with_progress {
                cmd = { "git", "push" },
                group = "Git",
                key = "git_push",
                title = "Git Push",
                message = "pushing",
            }
        end,
    },
    {
        name = "Status",
        group = "Git",
        execute = function()
            Toolbox.git.check_status.show()
        end,
    },
}

---@param opts? snacks.picker.Config
---@return snacks.Picker
function M.show(opts)
    opts = opts or {}
    local items = Toolbox.command.get_finder_items(M.cmds)

    return Snacks.picker(vim.tbl_deep_extend("force", opts, {
        title = Toolbox.name_for("Git"),
        items = items,
        format = "text",
        layout = MsConfig.snacks.layouts.vscode_bordered,
        confirm = function(picker, item)
            picker.was_picked = true
            items[item.idx].execute()
            picker:close()
        end,
    }))
end

return M
