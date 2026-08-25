-- VS Code-style multi-cursor: select the same word everywhere and edit all at once.
-- https://github.com/jake-stewart/multicursor.nvim

vim.pack.add { { src = 'https://github.com/jake-stewart/multicursor.nvim', version = '1.0' } }

local mc = require 'multicursor-nvim'
mc.setup()

local set = vim.keymap.set

-- Put a cursor on every match of the word under the cursor (or the visual selection)
set({ 'n', 'x' }, '<leader>a', mc.matchAllAddCursors, { desc = 'Select all same words' })

-- Add the next / previous match (like VS Code Ctrl/Cmd+D)
set({ 'n', 'x' }, '<C-n>', function() mc.matchAddCursor(1) end, { desc = 'Add next same word' })
set({ 'n', 'x' }, '<C-S-n>', function() mc.matchAddCursor(-1) end, { desc = 'Add previous same word' })

-- Extra cursors only: Esc clears them, arrows move the main cursor
mc.addKeymapLayer(function(layerSet)
  layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
  layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
  layerSet('n', '<esc>', function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end)
end)

local hl = vim.api.nvim_set_hl
hl(0, 'MultiCursorCursor', { reverse = true })
hl(0, 'MultiCursorVisual', { link = 'Visual' })
hl(0, 'MultiCursorSign', { link = 'SignColumn' })
hl(0, 'MultiCursorDisabledCursor', { reverse = true })
hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
