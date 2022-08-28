require("treesitter-context").setup {
    enable = true,
    patterns = {
        default = {
            "class",
            "function",
            "method",
        },
    },
    separator = "",
}
