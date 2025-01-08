local M = {}

function M.enable_auto_format(opts)
    opts = opts or {}
    vim.cmd([[
    augroup auto_format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format()
    augroup end
  ]])
    if opts.log then
        vim.notify("Enabled auto format")
    end
end

function M.disable_auto_format(opts)
    opts = opts or {}
    M.remove_augroup("auto_format_on_save")
    if opts.log then
        vim.notify("Disabled auto format")
    end
end

function M.toggle_auto_format(opts)
    if vim.fn.exists("#auto_format_on_save#BufWritePre") == 0 then
        M.enable_auto_format(opts)
    else
        M.disable_auto_format(opts)
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.api.nvim_create_user_command("LspToggleAutoFormat", function(e)
    require("plugins.lsp.commands.auto_format_on_save").toggle_auto_format { log = true }
end, { nargs = "*" })

return M
