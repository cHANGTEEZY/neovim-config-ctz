-- Extra IDE pieces: auto-close JSX tags, new file/folder helpers.

vim.pack.add { 'https://github.com/windwp/nvim-ts-autotag' }
require('nvim-ts-autotag').setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
}

-- Create a new file (relative to cwd). Example: src/utils/date.ts
vim.keymap.set('n', '<leader>n', function()
  vim.ui.input({ prompt = 'New file: ', completion = 'file' }, function(path)
    if not path or path == '' then return end
    local dir = vim.fn.fnamemodify(path, ':h')
    if dir ~= '.' and dir ~= '' then vim.fn.mkdir(dir, 'p') end
    vim.cmd.edit(path)
  end)
end, { desc = '[N]ew file' })

-- Create a new folder (relative to cwd)
vim.keymap.set('n', '<leader>N', function()
  vim.ui.input({ prompt = 'New folder: ', completion = 'dir' }, function(path)
    if not path or path == '' then return end
    vim.fn.mkdir(path, 'p')
    vim.notify('Created folder: ' .. path)
  end)
end, { desc = '[N]ew folder' })

-- Shift + arrows: select character by character (hold Shift like in VS Code)
vim.keymap.set('n', '<S-Left>', 'vh', { desc = 'Select left' })
vim.keymap.set('n', '<S-Right>', 'vl', { desc = 'Select right' })
vim.keymap.set('n', '<S-Up>', 'vk', { desc = 'Select up' })
vim.keymap.set('n', '<S-Down>', 'vj', { desc = 'Select down' })
vim.keymap.set('v', '<S-Left>', 'h', { desc = 'Extend select left' })
vim.keymap.set('v', '<S-Right>', 'l', { desc = 'Extend select right' })
vim.keymap.set('v', '<S-Up>', 'k', { desc = 'Extend select up' })
vim.keymap.set('v', '<S-Down>', 'j', { desc = 'Extend select down' })

-- Treat tsconfig / eslint JSON as JSONC (comments allowed)
vim.filetype.add {
  filename = {
    ['tsconfig.json'] = 'jsonc',
    ['jsconfig.json'] = 'jsonc',
    ['.eslintrc.json'] = 'jsonc',
  },
  pattern = {
    ['tsconfig%..*%.json'] = 'jsonc',
  },
}
