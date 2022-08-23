local null_ls = require("null-ls")

null_ls.setup {
    debug = false,
    sources = {
        -- Formatters
        null_ls.builtins.formatting.prettier, -- Typescript
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.rustfmt, -- Rust
    },
}
