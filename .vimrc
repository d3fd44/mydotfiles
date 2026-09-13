vim9script

g:mapleader = " "

set number
set relativenumber
set cursorline
set scrolloff=10
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set ignorecase
set smartindent
set smartcase
set incsearch
set hlsearch
set clipboard=unnamedplus
set mouse=a
set background=dark
set termguicolors
set ttimeout ttimeoutlen=5  # bc vim sucks inside tmux (delays forever after pressing <ESC>)

nnoremap <Leader>e <CMD>Ex<CR>
nnoremap <C-q>     <CMD>bd<CR>
nnoremap <ESC>     <CMD>nohlsearch<CR>

augroup rmbg
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
augroup END

colorscheme catppuccin

syntax on
