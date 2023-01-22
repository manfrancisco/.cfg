-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim', commit = '1d0cf98a561f7fd654c970c49f917d74fafe1530'}

    -- Navigation
    use {'theprimeagen/harpoon', commit = '21d0d1bfa3000e4384740bfaefa0ebc51c773786'}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = {'nvim-lua/plenary.nvim'}}
    -- Sets project root
    -- use {'ahmedkhalf/project.nvim', commit = '685bc8e3890d2feb07ccf919522c97f7d33b94e4'}

    -- Editing
    use {'Pocco81/auto-save.nvim', commit = '979b6c82f60cfa80f4cf437d77446d0ded0addf0'}
    use {'nvim-treesitter/nvim-treesitter', tag = 'v0.8.1'}
    -- Sows the surrounding context in deeply nested code
    use {
        'nvim-treesitter/nvim-treesitter-context',
        commit = 'cacee4828152dd3a83736169ae61bbcd29a3d213'
    }
    use {'mbbill/undotree', tag = 'rel_6.1'}
    use {'windwp/nvim-autopairs', commit = '31042a5823b55c4bfb30efcbba2fc1b5b53f90dc'}
    -- Comments
    use {'tpope/vim-commentary', tag = 'v1.3'}
    -- Dynamically changes `commentstring` depending on your location in the file
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        commit = 'a0f89563ba36b3bacd62cf967b46beb4c2c29e52'
    }

    -- Git
    use {'tpope/vim-fugitive', tag = 'v3.7'}

    -- Visual
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        commit = '0050b308552e45f7128f399886c86afefc3eb988'
    }
    use {'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.2'}

    -- Colorschemes
    use {'folke/tokyonight.nvim', tag = 'v1.0.0'}

    -- Terminal
    use {'akinsho/toggleterm.nvim', tag = '2.3.0'}

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
