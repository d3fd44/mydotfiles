vim9cmd g:mapleader = " "


set number
set relativenumber 
set scrolloff=10 
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set incsearch
set hlsearch
set clipboard=unnamedplus
set mouse=a

autocmd Filetype make set noexpandtab


nnoremap <Leader>e :Ex<CR>
nnoremap <C-q>     :bd<CR>
nnoremap n       :bnext<CR> " <A-n>
nnoremap p       :bprev<CR> " <A-p>
nnoremap <Esc>     :nohl<CR>

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

set background=dark
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

syntax on
