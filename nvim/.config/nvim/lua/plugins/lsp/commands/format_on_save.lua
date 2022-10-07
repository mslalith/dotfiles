local M = {}

function M.enable_format_on_save()
    -- autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
    vim.cmd([[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format()
    augroup end
  ]])
    vim.notify("Enabled Format on save")
end

function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled Format on save")
end

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.cmd(
    [[ command! LspToggleAutoFormat execute 'lua require("plugins.lsp.commands.format_on_save").toggle_format_on_save()' ]]
)

return M
