local M = {
    "rmagatti/auto-session",
    lazy = false,
}

function M.config()
    vim.opt.sessionoptions = {
        "blank",
        "buffers",
        "curdir",
        "tabpages",
        "winsize",
        "help",
        "globals",
        "skiprtp",
        "folds",
        "winpos",
        "terminal",
        "localoptions",
    }

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
        auto_restore = false,
        pre_save_cmds = { close_all_floating_wins },
        auto_session_use_git_branch = true,
        bypass_save_filetypes = { "snacks_dashboard" },
    }
end

return M
