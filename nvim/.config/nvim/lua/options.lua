-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Enable persistent undo
vim.o.undofile = true
-- Set location where undo data is stored
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'

-- Wrap text to 100 characters
vim.o.textwidth = 99
-- Show vertical line to indicate line length limit
vim.o.colorcolumn = "100"

-- Convert tabs to spaces
vim.o.expandtab = true
-- Set tabs to 4 spaces
vim.o.tabstop = 4
-- -- The number of spaces inserted for each indentation
vim.o.shiftwidth = 4
vim.o.numberwidth = 4

vim.cmd 'autocmd Filetype html setlocal ts=2 sw=2'
vim.cmd 'autocmd Filetype javascript setlocal ts=2 sw=2'
vim.cmd 'autocmd Filetype javascriptreact setlocal ts=2 sw=2'
vim.cmd 'autocmd Filetype typescript setlocal ts=2 sw=2'
vim.cmd 'autocmd Filetype typescriptreact setlocal ts=2 sw=2'

-- Word wrap
vim.o.wrap = false

-- Highlight the line the cursor is on
vim.o.cursorline = true

-- Creates a swapfile
vim.o.swapfile = false

-- Hides the mode indicator e.g. -- INSERT --
vim.o.showmode = false
