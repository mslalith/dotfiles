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
    if client.server_capabilities.document_highlight then
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

    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    map("n", "ff", "<cmd>lua vim.lsp.buf.rename()<CR>")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    map("n", "<A-Enter>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    -- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

    vim.cmd([[ command! Format execute "lua vim.lsp.buf.format()" ]])
end

local navic = require("nvim-navic")

local function attach_navic(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    attach_navic(client, bufnr)
end

-- Capabilities
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
