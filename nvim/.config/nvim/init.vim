" Plugins: {{{
call plug#begin('~/git/vim-plug')

" Themes
Plug 'mkarmona/colorsbox'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'

" Appearance
Plug 'vim-airline/vim-airline'
"Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Utility
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'

call plug#end()
" }}}

" Normal Settings: {{{
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set colorcolumn=81,105
set cursorline
set number

set foldmethod=manual
set wildmode=longest,full
set ignorecase
set lazyredraw
set scrolloff=8
set mouse=a
set modeline
" }}}

" Key Mappings: {{{
let mapleader= ","

" System Clipboard
noremap <leader>y "+y
noremap <leader>p "+p
inoremap <leader>p <ESC>"+pa

" Normal Mappings
nnoremap <leader>j :bnext! <CR>
nnoremap <leader>k :bprev! <CR>
nnoremap <leader>q :bw <CR>
nnoremap <Leader>n :NERDTreeToggle <CR>
nnoremap <silent> <ESC> :nohlsearch<CR>

" Clear Annoying Keys
nnoremap Q <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>
noremap <F1> <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>
inoremap <F1> <nop>

" Remap command history
noremap q: <nop>
noremap <leader>h q:
" }}}

" Airline: {{{
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_left_sep = '▌'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '▐'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline_theme='mybase16'
"let g:airline_extensions = ['tabline', 'whitespace', 'branch']
let g:airline_extensions = ['tabline', 'branch']

set noshowmode
" }}}

" Startify: {{{
let g:startify_custom_header = [
            \"                         _           ",
            \"                        (_)          ",
            \"   _ __   ___  _____   ___ _ __ ___  ",
            \"  | '_ \\ / _ \\/ _ \\ \\ / / | '_ ` _ \\ ",
            \"  | | | |  __/ (_) \\ V /| | | | | | |",
            \"  |_| |_|\\___|\\___/ \\_/ |_|_| |_| |_|",
            \]

let g:startify_list_order = [["Recent files:"], "files", ["Sessions:"], "sessions", ["Bookmarks:"], "bookmarks"]
let g:startify_bookmarks = ["~/.config/nvim/init.vim"]
let g:startify_session_dir = "~/.local/share/nvim/sessions"
let g:startify_change_to_dir = 0
" }}}

" Goyo: {{{
function! s:goyo_leave()
    highlight Normal ctermfg=07 ctermbg=234
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" EasyMotion: {{{
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

map <leader>f <Plug>(easymotion-sn)
map <leader>w <Plug>(easymotion-bd-w)
map <leader>l <Plug>(easymotion-bd-jk)
" }}}

" IndentLine: {{{
let g:indentLine_color_term = 8
let g:indentLine_char = '▶'
let g:indentLine_first_char = '▶'
let g:indentLine_showFirstIndentLevel = 1
"}}}

" Colors: {{{
colorscheme colorsbox-stnight

function MyColors()
    set background=dark

    " Normal Colors
    "highlight Normal ctermfg=07 ctermbg=234
    highlight Normal ctermfg=NONE ctermbg=NONE
    "highlight ColorColumn ctermbg=235
    "highlight CursorLine ctermbg=235
    highlight ColorColumn ctermbg=0
    highlight CursorLine ctermbg=0
    "highlight CursorLineNr ctermbg=236 ctermfg=214
    highlight CursorLineNr ctermbg=0 ctermfg=3
    highlight StatusLine ctermbg=236 ctermfg=245 cterm=NONE
    highlight WildMenu ctermfg=214 ctermbg=236
    highlight Folded ctermbg=0


    " Startify Colors
    highlight StartifyHeader ctermfg=07
    highlight StartifyFile ctermfg=07
    highlight StartifyNumber ctermfg=01
    highlight StartifySelect ctermfg=09
    highlight StartifyPath ctermfg=11

    " EasyMotion Colors
    highlight EasyMotionIncSearch ctermfg=214
    highlight EasyMotionTarget ctermbg=NONE ctermfg=214 cterm=bold
endfunction

execute MyColors()
" }}}

" Highlights: {{{
syntax match lenght /lenght/
highlight link lenght Error
" }}}

" Commands_and_Functions: {{{
command W w
command Q q
command Wq wq
command WQ wq

command -range QR <line1>,<line2>!curl -s -F-=\<- qrenco.de
" }}}

" Printing: {{{
let g:html_number_lines = 0
let g:html_font = "Courier New"

function HTML2PDF(...)
    "Requires wkhtmltopdf-static from AUR
    "TODO figure out how to format commands better
    "TODO better arguments
    "TODO better structure

    let l:default_font_size = '12.5'
    let l:color_scheme = 'lucius'

    let l:old_colors = g:colors_name
    let l:font_size = get(a:, '1', l:default_font_size)
    "let l:html_path = '/tmp/' . expand('%:t:r:r') . '.html'
    "let l:pdf_path = get(a:, '2', expand('%:t:r:r') . '.pdf')
    let l:file_name = expand('%:t')
    let l:html_path = '/tmp/' . expand('%:t') . '.html'
    let l:pdf_path = get(a:, '2', expand('%:t') . '.pdf')

    set background=light
    execute 'colorscheme' l:color_scheme
    highlight Normal guifg=#000000 guibg=#FFFFFF ctermfg=16 ctermbg=15
    IndentLinesDisable

    TOhtml
    execute 'w!' l:html_path
    q!

    execute printf("%s%s%s%s%s", '!sed -i "s/body {/body { font-size: ', l:font_size, 'px;/g; s/pre {/pre { font-size:', l:font_size,  'px;/g"') l:html_path

    "execute '!wkhtmltopdf
        "\ --no-background
        "\ --margin-left 15
        "\ --margin-right 15
        "\ --margin-top 15
        "\ --margin-bottom 15
        "\ --header-right "[page]/[topage]"
        "\ --header-left "'l:file_name'"
        "\ --header-font-name "'g:html_font'"
        "\ --header-font-size 9
        "\ --header-spacing 5
        "\ --header-line'
        "\ l:html_path
        "\ l:pdf_path

        execute printf("%s%s%s%s%s%s%s%s%s", '!wkhtmltopdf --no-background --margin-left 15 --margin-right 15 --margin-top 15 --margin-bottom 15 --header-right "[page]/[topage]" --header-left "', l:file_name, '" --header-font-name "', g:html_font, '" --header-font-size 9 --header-spacing 5 --header-line "', l:html_path, '" "', l:pdf_path, '"')

    IndentLinesEnable

    execute 'colorscheme' l:old_colors
    execute MyColors()
endfunction
" }}}

" Spelling: {{{
set spellfile=~/.config/nvim/spell/additions.add
set spelllang=de_de,en_us,umlauts
" }}}

" vim: fdm=marker:
