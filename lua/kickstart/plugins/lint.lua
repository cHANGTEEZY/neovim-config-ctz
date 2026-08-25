-- Extra linting (TypeScript / JavaScript ESLint is handled by the eslint LSP)

vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'
lint.linters_by_ft = {
  -- Keep empty unless you install extra linters via Mason.
  -- TS/JS diagnostics come from ts_ls + eslint language servers.
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then lint.try_lint() end
  end,
})
