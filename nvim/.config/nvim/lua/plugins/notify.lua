local M = {
    "rcarriga/nvim-notify",
    lazy = false
}

function M.config()
local notify = require("notify")
vim.notify = notify

notify.setup {
    -- background_colour = "Normal",
    background_colour = "#000000",
}

vim.api.nvim_create_user_command("ClearNotifications", notify.dismiss, { nargs = "*" })
end

return M
