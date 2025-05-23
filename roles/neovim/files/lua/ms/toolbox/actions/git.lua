---@class toolbox.actions.Git
local M = {}

function M.create_branch()
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
end

---@param on_success? fun()
function M.commit(on_success)
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
                if on_success then
                    on_success()
                end
            end,
            on_failure = function()
                Toolbox.notifier.error("Failed to commit")
            end,
        }
    end)
end

---@param on_success? fun()
function M.amend(on_success)
    local result = M.get_last_local_commit_message()
    if result[1] == "" then
        Toolbox.notifier.info("No local commited changes available")
        return
    end

    Snacks.input.input({
        prompt = "Amend Message",
        default = result[1],
    }, function(name)
        if not name then
            return
        end
        if name == "" then
            Toolbox.notifier.error("Commit name cannot be empty")
            return
        end

        local commit_cmd = { "git", "commit", "--amend", "-m", name }
        Toolbox.util.cmd.run_with_progress {
            cmd = commit_cmd,
            group = "Git",
            key = "git_commit",
            title = "Git Commit",
            message = "commiting",
            on_success = function()
                Toolbox.notifier.info("Commit successful!")
                if on_success then
                    on_success()
                end
            end,
            on_failure = function()
                Toolbox.notifier.error("Failed to commit")
            end,
        }
    end)
end

function M.push()
    Toolbox.util.cmd.run_with_progress {
        cmd = { "git", "push" },
        group = "Git",
        key = "git_push",
        title = "Git Push",
        message = "pushing",
    }
end

---@return string[]
function M.get_last_local_commit_message()
    local cmd = { "git", "log", "@{u}..", "-1", "--oneline", "--pretty=format:%s" }
    return Toolbox.util.cmd.run_sync(cmd)
end

return M
