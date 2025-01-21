local M = {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
}

function M.config()
    require("dapui").setup {
        icons = { expanded = "▾", collapsed = "▸" },
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.25 },
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 10, -- columns
                position = "bottom",
            },
        },
    }
end

return M
