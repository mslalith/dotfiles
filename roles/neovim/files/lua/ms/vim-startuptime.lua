local M = {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
}

function M.config()
    vim.g["startuptime_tries"] = 15
    vim.g["startuptime_exe_args"] = { "+let g:auto_session_enabled = 0" }
end

return M
