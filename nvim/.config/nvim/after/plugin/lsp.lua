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

-- Cmp setup here, after lsp-zero setup
local keymap = require('lua.user.keymap')

keymap.cmp_setup()
