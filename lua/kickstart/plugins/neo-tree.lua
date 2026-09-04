-- Neo-tree: sidebar file explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- Sidebar: Space+e jumps between explorer and editor (does not close the tree).
-- Ctrl+b shows / hides the tree. \ and Space+o reveal the current file.
vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd.wincmd 'p'
  else
    vim.cmd 'Neotree reveal'
  end
end, { desc = 'Focus file [E]xplorer / back to editor', silent = true })
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal file in explorer', silent = true })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal file in explorer', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = { padding = 1 },
  },
  source_selector = {
    winbar = true,
    sources = {
      { source = 'filesystem', display_name = ' Files' },
      { source = 'buffers', display_name = ' Buffers' },
      { source = 'git_status', display_name = ' Git' },
    },
  },
  window = {
    width = 34,
    mappings = {
      ['<space>'] = 'none', -- keep leader free
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['<cr>'] = 'open',
      ['P'] = { 'toggle_preview', config = { use_float = true } },
      -- Create / rename / delete
      ['a'] = { 'add', config = { show_path = 'relative' } },
      ['A'] = { 'add_directory', config = { show_path = 'relative' } },
      ['n'] = { 'add', config = { show_path = 'relative' } },
      ['N'] = { 'add_directory', config = { show_path = 'relative' } },
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy',
      ['m'] = 'move',
      ['q'] = 'close_window',
      ['R'] = 'refresh',
      ['H'] = 'toggle_hidden',
      -- Move the cursor between explorer and editor
      ['<C-h>'] = function() vim.cmd.wincmd 'h' end,
      ['<C-l>'] = function() vim.cmd.wincmd 'l' end,
      ['<C-j>'] = function() vim.cmd.wincmd 'j' end,
      ['<C-k>'] = function() vim.cmd.wincmd 'k' end,
    },
  },
  filesystem = {
    follow_current_file = { enabled = true, leave_dirs_open = true },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = 'open_default',
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = { 'node_modules', '.git', 'dist', 'build', '.next', 'coverage', 'vendor' },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
      },
    },
  },
}
