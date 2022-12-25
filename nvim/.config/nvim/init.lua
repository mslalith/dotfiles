-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    }
end
vim.opt.runtimepath:prepend(lazypath)

require("ms_config")
ms.global("mapleader", " ")
ms.keys.insert_mode("jk", "<ESC>")
ms.disable_distribution_plugins()

require("lazy").setup("plugins", {
    defaults = { lazy = true },
})
require("core")
