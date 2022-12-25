local M = {
    "rmagatti/auto-session",
    lazy = false,
}

function M.config()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

    local function close_all_floating_wins()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local config = vim.api.nvim_win_get_config(win)
            if config.relative ~= "" then
                vim.api.nvim_win_close(win, false)
            end
        end
    end

    require("auto-session").setup {
        log_level = "error",
        pre_save_cmds = { close_all_floating_wins },
        auto_session_use_git_branch = false,
    }
end

return M
