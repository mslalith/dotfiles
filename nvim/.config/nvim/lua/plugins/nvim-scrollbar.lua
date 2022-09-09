require("scrollbar").setup {
    handle = {
        highlight = "PmenuSbar",
    },
}

-- nvim-hlslens integration
require("scrollbar.handlers.search").setup()
