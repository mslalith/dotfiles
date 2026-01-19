local M = {
    "onsails/lspkind-nvim",
    optional = true,
}

function M.config()
    require("lspkind").init()
end

return M
