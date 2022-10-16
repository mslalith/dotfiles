local wilder = require("wilder")

wilder.setup {
    modes = { ":", "/", "?" },
}

wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer {
        pumblend = 20,
    }
)
