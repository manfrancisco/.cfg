set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set cc=100
set mouse=a
syntax on

" If there is a vimrc in the current directory, source it
set exrc
set guicursor=
set nohlsearch
" Keep unsaved buffers open in the background
set hidden
set noerrorbells
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set termguicolors

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticeable delays
" and poor user experience.
set updatetime=50

let mapleader = " "

" Join lines
nnoremap <C-j> <S-j>

" Fast scrolling
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

" Copy and paste to and from the system clipboard
vnoremap <C-c> "+y
vnoremap <C-v> "+p
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pi

" Escape to normal mode
inoremap jj <Esc>

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

" Fuzzy find
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Quit all
nnoremap <leader>qq :confirm qall<cr>

" Create windows
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Close windows
nnoremap <leader>w :confirm q<cr>

" Move between windows
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

