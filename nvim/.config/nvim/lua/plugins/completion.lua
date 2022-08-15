local lspkind = require("lspkind")
lspkind.init()

local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp = require("cmp")
cmp.setup {
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
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

    ["<C-space>"] = cmp.mapping(function (_)
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
    end, { "i", "c" }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
				cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s", }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
				cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", }),
  },

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },

  window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

  view = {
    entries = "native",
  },

  experimental = {
    ghost_text = true,
  },
}


_ = vim.cmd [[
  augroup CmpZsh
    au!
    autocmd Filetype zsh lua require("cmp").setup.buffer { config = { { name = "zsh" }, } }
  augroup END
]]

--[[
" Disable cmp for a buffer
autocmd FileType TelescopePrompt lua require("cmp").setup.buffer { enabled = false }
--]]

