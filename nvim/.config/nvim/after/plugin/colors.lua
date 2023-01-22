local ok, _ = pcall(require, 'tokyonight')
if not ok then return end

vim.cmd.colorscheme('tokyonight-storm')

