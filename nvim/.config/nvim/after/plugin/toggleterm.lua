local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then return end

toggleterm.setup()
vim.keymap.set('n', 'tt', ':ToggleTerm<cr>')
