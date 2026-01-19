return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    vim.keymap.set("n", "<C-g>", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor at next match" })
    vim.keymap.set("x", "<C-g>", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor at next match" })

    vim.keymap.set("n", "<C-S-g>", function()
      mc.deleteCursor()
    end, { desc = "Add cursor at previous match" })
    vim.keymap.set("x", "<C-S-g>", function()
      mc.deleteCursor()
    end, { desc = "Add cursor at previous match" })

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
