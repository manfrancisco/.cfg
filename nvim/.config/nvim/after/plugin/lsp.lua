local lsp_ok, lsp = pcall(require, 'lsp-zero')

if lsp_ok then
    lsp.preset({})

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

    -- lspconfig setup here, e.g.
    -- local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
    -- if lspconfig_ok then
    --     lspconfig.rust_analyzer.setup({})
    -- end

    lsp.setup()
end

-- Cmp setup here, e.g.
-- local cmp_ok, cmp = pcall(require, 'cmp')
-- if cmp_ok then
--     cmp.setup({ mapping = {
--         ['<CR>'] = cmp.mapping.confirm({ select = false }),
--         ['<C-Space>'] = cmp.mapping.complete(),
--     } })
-- end
