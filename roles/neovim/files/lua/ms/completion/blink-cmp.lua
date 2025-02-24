return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        build = "cargo build --release",
        dependencies = {
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
                nerd_font_variant = "mono",
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
                        preselect = true,
                        auto_insert = false,
                    },
                    cycle = {
                        from_bottom = true,
                        from_top = true,
                    },
                },
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    auto_show = true,
                    border = "rounded",
                    draw = {
                        treesitter = { "lsp" },
                        columns = function(ctx)
                            if ctx.mode == "cmdline" then
                                return {
                                    { "label", "label_description", gap = 2 },
                                }
                            else
                                return {
                                    { "kind_icon", "label", "label_description", gap = 2 },
                                }
                            end
                        end,
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
                default = { "lsp", "path", "snippets", "buffer" },
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
            opts.appearance.kind_icons = vim.tbl_extend("force", opts.appearance.kind_icons, MsConfig.icons.kinds)
        end,
    },

    --------------------------------------
    -- LazyDev source
    --------------------------------------
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
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

    --------------------------------------
    -- Emoji source
    --------------------------------------
    {
        "saghen/blink.cmp",
        dependencies = {
            "moyiz/blink-emoji.nvim",
        },
        opts = {
            -- sources = {
            --     default = { "emoji" },
            --     providers = {
            --         emoji = {
            --             name = "Emoji",
            --             module = "blink-emoji",
            --             score_offset = 15,
            --             opts = { insert = true }, -- Insert emoji (default) or complete its name
            --         },
            --     },
            -- },
        },
    },
}
