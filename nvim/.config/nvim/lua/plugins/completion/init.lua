local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "onsails/lspkind-nvim",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "folke/noice.nvim",
        "abecodes/tabout.nvim",
    },
}

function M.config()
    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    local cmp = require("cmp")
    cmp.setup {
        mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
            ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<C-y>"] = cmp.mapping(
                cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                { "i", "c" }
            ),

            ["<C-space>"] = cmp.mapping(function(_)
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end, { "i", "c" }),

            ["<Tab>"] = cmp.mapping(function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                    cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                    cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        sources = {
            { name = "nvim_lsp_signature_help" },
            { name = "buffer", keyword_length = 5 },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
        },

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = require("lspkind").cmp_format {
                mode = "symbol",
                maxwidth = 50,
                ellipsis_char = "...",
            },
        },

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        view = {
            entries = "custom",
        },

        experimental = {
            ghost_text = true,
        },
    }

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            sources = cmp.config.sources {
                { name = "nvim_lsp_document_symbol" },
                { name = "buffer" },
            },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] },
            { name = "path" },
        },
    })

    _ = vim.cmd([[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require("cmp").setup.buffer { config = { { name = "zsh" }, } }
  augroup END
]])

    --[[
" Disable cmp for a buffer
autocmd FileType TelescopePrompt lua require("cmp").setup.buffer { enabled = false }
--]]
end

return M
