local M = {
    "norcalli/nvim-colorizer.lua",
    event = "CursorHold",
}

function M.config()
    require("colorizer").setup()
end

return M
