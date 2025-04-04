local M = {
    "L3MON4D3/LuaSnip",
    optional = true,
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    version = "v2.*",
}

function M.config()
    require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load {
    --     paths = { vim.fn.stdpath("config") .. "/snippets" },
    -- }
end

return M
