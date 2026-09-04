-- Go extras: switch between file/test, run tests, run the package.

local function go_package_dir()
  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then return '.' end
  return vim.fn.fnamemodify(file, ':h')
end

local function go_term(cmd)
  vim.cmd 'botright split'
  vim.cmd.terminal(cmd)
  vim.cmd.startinsert()
end

local function nearest_test_name()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, row, false)
  for i = #lines, 1, -1 do
    local name = lines[i]:match('^func%s+(Test[%w_]+)') or lines[i]:match('^func%s+(Benchmark[%w_]+)')
    if name then return name end
  end
end

vim.keymap.set('n', '<leader>ga', function()
  local file = vim.api.nvim_buf_get_name(0)
  if file:match('_test%.go$') then
    vim.cmd.edit((file:gsub('_test%.go$', '.go')))
  elseif file:match('%.go$') then
    vim.cmd.edit((file:gsub('%.go$', '_test.go')))
  else
    vim.notify('Not a Go file', vim.log.levels.WARN)
  end
end, { desc = '[G]o [A]lternate test file' })

vim.keymap.set('n', '<leader>gt', function()
  go_term('go test -v ' .. vim.fn.shellescape(go_package_dir()))
end, { desc = '[G]o [T]est package' })

vim.keymap.set('n', '<leader>gT', function()
  local name = nearest_test_name()
  if not name then
    vim.notify('No Test/Benchmark found above cursor', vim.log.levels.WARN)
    return
  end
  go_term('go test -v -run ' .. vim.fn.shellescape('^' .. name .. '$') .. ' ' .. vim.fn.shellescape(go_package_dir()))
end, { desc = '[G]o [T]est nearest' })

vim.keymap.set('n', '<leader>gr', function()
  go_term('go run ' .. vim.fn.shellescape(go_package_dir()))
end, { desc = '[G]o [R]un package' })
