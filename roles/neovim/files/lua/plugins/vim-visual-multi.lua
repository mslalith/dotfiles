return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
        ms.keys.normal_mode("<C-g>", "<Plug>(VM-Find-Under)", "Multi cursor")
    end,
}
