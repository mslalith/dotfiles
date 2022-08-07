local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end


local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  local function map(mode, l, r)
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "ff", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  -- map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>")
  map("n", "gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>")
  map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  vim.cmd [[ command! Format execute "lua vim.lsp.buf.formatting()" ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
