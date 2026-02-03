vim9cmd g:mapleader = " "


set number
set relativenumber 
set cursorline
set scrolloff=10 
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set incsearch
set hlsearch
set clipboard=unnamedplus
set mouse=a
set background=dark
set termguicolors

augroup filetypeRelatedActions
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END


nnoremap <Leader>e :Ex<CR>
nnoremap <C-q>     :bd<CR>
nnoremap n       :bnext<CR> " <A-n>
nnoremap p       :bprev<CR> " <A-p>
nnoremap <Esc>     :nohl<CR>


augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * call FlashYankedText()
augroup END

augroup preserveColors
    autocmd!
    autocmd ColorScheme * highlight FlashYank guifg=black guibg=#4cffd0
augroup END

function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif

    let matchId = matchadd('FlashYank', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(150, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
     while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]
        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

syntax on
