-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

_G.MsConfig = require("util")

-- Setup lazy and import plugins
require("lazy").setup {
    spec = {
        { import = "plugins" },
        { import = "plugins.colorscheme" },
        { import = "plugins.lsp" },
        { import = "plugins.completion" },
        { import = "plugins.snacks" },
        { import = "plugins.mini" },
        { import = "plugins.extras" },
        { import = "plugins.extras.languages" },
    },
    defaults = {
        lazy = true,
    },
    ui = { border = "rounded" },
}

local function disable_distribution_plugins()
    vim.g["loaded_gzip"] = 1
    vim.g["loaded_tar"] = 1
    vim.g["loaded_tarPlugin"] = 1
    vim.g["loaded_zip"] = 1
    vim.g["loaded_zipPlugin"] = 1
    vim.g["loaded_getscript"] = 1
    vim.g["loaded_getscriptPlugin"] = 1
    vim.g["loaded_vimball"] = 1
    vim.g["loaded_vimballPlugin"] = 1
    vim.g["loaded_matchit"] = 1
    vim.g["loaded_matchparen"] = 1
    vim.g["loaded_2html_plugin"] = 1
    vim.g["loaded_logiPat"] = 1
    vim.g["loaded_rrhelper"] = 1
    vim.g["loaded_netrw"] = 1
    vim.g["loaded_netrwPlugin"] = 1
    vim.g["loaded_netrwSettings"] = 1
    vim.g["loaded_netrwFileHandlers"] = 1
end

disable_distribution_plugins()
