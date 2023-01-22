local ok, ts_builtin = pcall(require, 'telescope.builtin')
if not ok then return end

vim.keymap.set('n', '<leader>pf', ts_builtin.find_files, {})
vim.keymap.set('n', '<C-p>', ts_builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    ts_builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
