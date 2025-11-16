local map = vim.keymap.set

map('i', 'jk', '<ESC>')

-- Delete Lines without copying
map('n', '<C-G>', '"_dd', { desc = 'Delete Line' })
map('v', '<C-G>', '"_dd<ESC>', { desc = 'Delete Line' })

-- Toggle Relative Line Numbers
map('n', '<leader>rn', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle Relative Line Number' })

map('n', '∆', ':m .+1<CR>==') -- move line up(n)
map('n', '˚', ':m .-2<CR>==') -- move line down(n)
map('v', '∆', ":m '>+1<CR>gv=gv") -- move line up(v)
map('v', '˚', ":m '<-2<CR>gv=gv") -- move line down(v)

-- Show all diagnostics on current line in floating window
map('n', '<Space>ds', ':lua vim.diagnostic.open_float()<CR>', { desc = 'Open Diagnostic', noremap = true, silent = true })

-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map('n', '<Space>dn', ':lua vim.diagnostic.goto_next()<CR>', { desc = 'Next Diagnostic', noremap = true, silent = true })

-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map('n', '<Space>dp', ':lua vim.diagnostic.goto_prev()<CR>', { desc = 'Prev Diagnostic', noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('i', '<C-c>', '<Esc>')
--
--
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undo tree' })
