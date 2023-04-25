local ok, lsp = pcall(require, 'lsp-zero')
if not ok then return end

lsp.preset('recommended')

lsp.nvim_workspace()

lsp.ensure_installed({
    'bashls',
    'eslint',
    'ltex',
    'lua_ls',
    'marksman',
    'rust_analyzer',
    'tsserver',
})

lsp.setup()
