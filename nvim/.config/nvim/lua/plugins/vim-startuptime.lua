local M = {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
}

function M.config()
ms.global("startuptime_tries", 15)
ms.global("startuptime_exe_args", { "+let g:auto_session_enabled = 0" })
end

return M
