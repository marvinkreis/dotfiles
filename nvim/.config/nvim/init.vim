" TODO: colors in the beginning, Startify Highlighting in the Startify section

" Plugins: {{{
call plug#begin('~/git/vim-plug')

Plug 'mkarmona/colorsbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'lilydjwg/colorizer'

call plug#end()
" }}}

" Airline: {{{
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_theme='mytheme'

let g:airline_extensions = ['tabline', 'whitespace']

set noshowmode
" }}}

" Startify: {{{
let g:startify_custom_header = [
            \"                             ",
            \"         █▄████▄█            ",
            \"        ▄█▀██▀████▄                                     _           ",
            \"        ███▀▀███████▄▄                                 (_)          ",
            \"        █▄▀ ▀▀▄███████████▀▀▀     _ __   ___  _____   ___ _ __ ___  ",
            \"        ██████████████████       | '_ \\ / _ \\/ _ \\ \\ / / | '_ ` _ \\ ",
            \"        ██████████████████       | | | |  __/ (_) \\ V /| | | | | | |",
            \"        ▀████████████████        |_| |_|\\___|\\___/ \\_/ |_|_| |_| |_|",
            \"         ██  █▀    █▀  ██    ",
            \"         ▀             ▀     ",
            \"                             "
            \]

let g:startify_list_order = [["Recent files:"], "files", ["Sessions:"], "sessions", ["Bookmarks:"], "bookmarks"]
let g:startify_bookmarks = ["~/.config/nvim/init.vim"]
let g:startify_session_dir = "~/.local/share/nvim/sessions"
" }}}

" Goyo: {{{
function! s:goyo_leave()
    highlight Normal ctermfg=07 ctermbg=234
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}


let mapleader= " "
map <F1> :bprev! <CR>
map <F2> :bnext! <CR>
map <Leader>n = :NERDTreeToggle <CR>

filetype plugin indent on "auto indent
set expandtab "spaces instead of tabs"
set shiftwidth=4 "set indent widh to 4
set softtabstop=4 "set number of collums for a tab to 4
set tabstop=4 "set width of a normal tab to 4

set colorcolumn=81 "highlight the 81th column

set number "enable line numbers
set fdm=marker "manual folding mode
set shortmess+=I "disable startup message

" Colors: {{{
colorscheme colorsbox-stnight
" highlight Normal ctermfg=254 ctermbg=234
highlight Normal ctermfg=07 ctermbg=234
highlight ColorColumn ctermbg=235
highlight StartifyHeader ctermfg=07
highlight StartifyFile ctermfg=07
highlight StartifyNumber ctermfg=01
highlight StartifySelect ctermfg=09
highlight StartifyPath ctermfg=11
" }}}
