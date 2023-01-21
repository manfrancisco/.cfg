-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim', commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530'}

    -- Navigation
    use {'theprimeagen/harpoon', commit = '21d0d1bfa3000e4384740bfaefa0ebc51c773786'}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = {'nvim-lua/plenary.nvim'}}

    -- Editing
    use {'Pocco81/auto-save.nvim', commit = '979b6c82f60cfa80f4cf437d77446d0ded0addf0'}
    use {'nvim-treesitter/nvim-treesitter', tag = 'v0.8.1', { run = ':TSUpdate' }}
    use {'mbbill/undotree', tag = 'rel_6.1'}
    use {'numToStr/Comment.nvim', tag = 'v0.7.0'}

    -- Git
    use {'tpope/vim-fugitive', tag = 'v3.7'}

    -- Colorschemes
    use {'rose-pine/neovim', as = 'rose-pine', tag = 'v1.1.0'}
    use {'folke/tokyonight.nvim', tag = 'v1.0.0'}

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            -- {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
end)
