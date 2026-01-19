return {
    "jake-stewart/multicursor.nvim",
    event = "VeryLazy",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        MsConfig.keys.normal("<C-g>", function()
            mc.matchAddCursor(1)
        end, "Add cursor at next match")
        MsConfig.keys.visual_block("<C-g>", function()
            mc.matchAddCursor(1)
        end, "Add cursor at next match")

        MsConfig.keys.normal("<C-S-g>", function()
            mc.deleteCursor()
        end, "Add cursor at previous match")
        MsConfig.keys.visual_block("<C-S-g>", function()
            mc.deleteCursor()
        end, "Add cursor at previous match")

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one.
            layerSet({ "n", "x" }, "<up>", mc.prevCursor)
            layerSet({ "n", "x" }, "<down>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end,
}
