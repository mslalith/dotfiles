return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
        MsConfig.keys.normal("<C-g>", "<Plug>(VM-Find-Under)", "Multi cursor")
    end,
}
