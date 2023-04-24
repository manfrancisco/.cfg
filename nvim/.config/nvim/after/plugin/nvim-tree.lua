local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()

vim.keymap.set('n', '<leader>vf', ':NvimTreeToggle<CR>')
