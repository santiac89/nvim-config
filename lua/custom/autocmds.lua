local ft_lsp_group = vim.api.nvim_create_augroup('ft_lsp_group', { clear = true })
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  pattern = { 'docker-compose.yaml', 'compose.yaml' },
  group = ft_lsp_group,
  desc = 'Fix the issue where the LSP does not start with docker-compose.',
  callback = function()
    vim.opt.filetype = 'yaml.docker-compose'
  end,
})

vim.diagnostic.config {
  virtual_text = false, -- Turn off inline diagnostics
}

-- Use this if you want it to automatically show all diagnostics on the
-- current line in a floating window. Personally, I find this a bit
-- distracting and prefer to manually trigger it (see below). The
-- CursorHold event happens when after `updatetime` milliseconds. The
-- default is 4000 which is much too long
vim.cmd 'autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()'
vim.o.updatetime = 300

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap('n', '<Space>ds', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap('n', '<Space>dn', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap('n', '<Space>dp', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
