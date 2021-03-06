require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "rust", "java", "kotlin", "python", "typescript" },
  -- ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
    enable = true,
  }
}

