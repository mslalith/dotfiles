return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    build = ":KanagawaCompile",
    config = function()
        -- kanagawa
        -- kanagawa-wave
        -- kanagawa-dragon
        -- kanagawa-lotus
        vim.cmd("colorscheme kanagawa")
    end,
}
