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
            Snacks.input.input({
                prompt = "New Branch Name",
            }, function(name)
                if not name then
                    return
                end
                if name == "" then
                    Toolbox.notifier.error("Branch name cannot be empty")
                    return
                end

                local check_branch_cmd = { "git", "branch", "--list", name }
                Snacks.picker.util.cmd(check_branch_cmd, function(data)
                    if data[1] ~= "" then
                        Toolbox.notifier.error("Branch already exists")
                        return
                    end

                    local create_branch_cmd = { "git", "checkout", "-b", name }
                    Snacks.picker.util.cmd(create_branch_cmd, function()
                        Toolbox.notifier.info("Branch created")
                    end)
                end)
            end)
        end,
    },
    {
        name = "Commit",
        group = "Git",
        execute = function()
            local diff_stage_cmd = { "git", "diff", "--cached", "--exit-code" }
            local data = Toolbox.util.cmd.run_sync(diff_stage_cmd, { notify_failure = false })
            if data[1] == "" then
                Toolbox.notifier.info("No staged changes to commit!")
                return
            end

            Snacks.input.input({
                prompt = "Commit Message",
            }, function(name)
                if not name then
                    return
                end
                if name == "" then
                    Toolbox.notifier.error("Commit name cannot be empty")
                    return
                end

                local commit_cmd = { "git", "commit", "-m", name }
                Toolbox.util.cmd.run_with_progress {
                    cmd = commit_cmd,
                    group = "Git",
                    key = "git_commit",
                    title = "Git Commit",
                    message = "commiting",
                    on_success = function()
                        Toolbox.notifier.info("Commit successful!")
                    end,
                    on_failure = function()
                        Toolbox.notifier.error("Failed to commit")
                    end,
                }
            end)
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
