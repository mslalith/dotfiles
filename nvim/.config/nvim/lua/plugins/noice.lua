require("noice").setup {
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
    lsp_progress = {
        enabled = false,
    },
}
