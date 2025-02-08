return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        build = "cargo build --release",
        dependencies = {
            "moyiz/blink-emoji.nvim",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind-nvim",
            "xzbdmw/colorful-menu.nvim",
        },

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "normal",
            },
            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                    show_documentation = true,
                    -- Disable if you run into performance issues
                    treesitter_highlighting = true,
                },
            },
            completion = {
                ghost_text = {
                    enabled = true,
                },
                documentation = {
                    window = { border = "rounded" },
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    -- Disable if you run into performance issues
                    treesitter_highlighting = true,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    auto_show = function(ctx)
                        return ctx.mode ~= "cmdline"
                    end,
                    border = "rounded",
                    draw = {
                        treesitter = { "lsp" },
                        columns = {
                            { "kind_icon", "label", "label_description", gap = 2 },
                            { "kind", gap = 2, "source_name" },
                        },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "emoji" },
                providers = {
                    emoji = {
                        module = "blink-emoji",
                        name = "Emoji",
                        score_offset = 15, -- Tune by preference
                        opts = { insert = true }, -- Insert emoji (default) or complete its name
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },

    --------------------------------------
    -- Icons
    --------------------------------------
    {
        "saghen/blink.cmp",
        opts = function(_, opts)
            opts.appearance = opts.appearance or {}
            opts.appearance.kind_icons = opts.appearance.kind_icons or {}
            opts.appearance.kind_icons = vim.tbl_extend("force", opts.appearance.kind_icons, MsVim.icons.kinds)
        end,
    },

    --------------------------------------
    -- LazyDev
    --------------------------------------
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100, -- show at a higher priority than lsp
                    },
                },
            },
        },
    },
}
