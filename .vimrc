vim9script

g:mapleader = " "



## Options
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

augroup filetypeRelatedActions
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END



## Custom Operators
def SetOp(op: string, mode: string): string
    if (op == "surround")
        &operatorfunc = function('SurroundOp', [mode, v:count1])
    endif
    return 'g@'
enddef

def SurroundOp(mode: string, count: number, type: any): void
    echo "Enter surround char..."
    var lhc = nr2char(getchar())

    if lhc == nr2char(27) | return | endif

    var rhc = {'(': ')', '{': '}', '[': ']', '<': '>'}->get(lhc, lhc)
    var lhcmd = $"``{type == 'line' ? "^i" : "i"}{repeat(lhs, count)}"
    var rhcmd = $"{mode == 'n' ? '`[`]' : '`<`>'}{type == 'line' ? "g_a" : "a"}{repeat(rhs, count)}"

    execute $"normal! {rhcmd}\<Esc>{lhcmd}\<Esc>"
enddef



## Mappings
map      Y          y$
nnoremap <Leader>e :Ex<CR>
nnoremap <C-q>     :bd<CR>
nnoremap n       :bnext<CR> " <A-n>
nnoremap p       :bprev<CR> " <A-p>
nnoremap <Esc>     :nohl<CR>
nnoremap <expr> gs  SetOp("surround", 'n') .. '<Esc>g@'
xnoremap <expr> gs  SetOp("surround", 'v')



## Colors
augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * {
        if (v:event['operator'] == 'y')
            call FlashYankedText()
        endif
    }
augroup END

augroup preserveColors
    autocmd!
    autocmd ColorScheme * highlight FlashYank guifg=black guibg=#4cffd0
augroup END


def FlashYankedText(): void
    if (!exists('g:yankedTextMatches'))
        g:yankedTextMatches = []
    endif

    var matchId = matchadd('FlashYank', ".\\%>'\\[\\_.*\\%<']..")
    var windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(150, 'DeleteTemporaryMatch')
enddef

def DeleteTemporaryMatch(timerId: number): void
     while !empty(g:yankedTextMatches)
        var match = remove(g:yankedTextMatches, 0)
        var windowID = match[0]
        var matchID = match[1]
        try
            call matchdelete(matchID, windowID)
        catch
            echo "invalid matchID!"
        endtry
    endwhile
enddef

call plug#begin()
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

g:tokyonight_style = 'night'
g:tokyonight_enable_italic = 1
colorscheme tokyonight

syntax on
