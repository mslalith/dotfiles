return {
  "saghen/blink.cmp",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        show_documentation = true,
      },
    },
    cmdline = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = true },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
    completion = {
      ghost_text = {
        enabled = true,
      },
      documentation = {
        window = { border = "rounded" },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
        cycle = {
          from_bottom = true,
          from_top = true,
        },
      },
      menu = {
        auto_show = true,
        border = "rounded",
      },
    },
    sources = {
      providers = {
        snippets = {
          opts = {
            search_path = { vim.fn.stdpath("config") .. "/snippets" },
          },
        },
      },
    },
  },
}
