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
" Tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Appearance
set colorcolumn=81,105
set cursorline
set number
set wildmode=longest,full
set wildmenu
set laststatus=2
set hlsearch

set backspace=indent,eol,start
set foldmethod=manual
set modeline
set ignorecase
set scrolloff=8
set lazyredraw
set mouse=a
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

    " Gui Colors
    if has('gui')
        highlight Normal guifg=#b3b3b3 guibg=#1c1c1c
        highlight Comment gui=NONE
    endif
endfunction

execute MyColors()

" }}}

" Highlights: {{{
syntax match lenght /lenght/
highlight link lenght Error
" }}}

" Commands and Functions: {{{
command W w
command Q q
command Wq wq
command WQ wq

command -range QR <line1>,<line2>!curl -s -F-=\<- qrenco.de
" }}}

" Printing: {{{
let g:html_number_lines     = 0                 " actual TOhtml variable
let g:html_font             = "Courier New"     " actual TOhtml variable

let g:html_colorscheme      = "lucius"
let g:html_font_size        = 12 "TODO
let g:html_margin_left      = 15
let g:html_margin_right     = 15
let g:html_margin_bottom    = 15
let g:html_margin_top       = 15
let g:html_use_header       = 0
let g:html_header_font_size = 9
let g:html_header_font      = "Courier New"
let g:html_header_spacing   = 5
let g:html_header_line      = 1
let g:html_use_footer       = 0
let g:html_footer_font_size = 9
let g:html_footer_font      = "Courier New"
let g:html_footer_spacing   = 5
let g:html_footer_line      = 1

let g:html_header_left      = '%:t'
let g:html_header_right     = '[page]/[topage]'
let g:html_header_center    = '%d.%m.%Y'
let g:html_footer_left      = '%:t'
let g:html_footer_right     = '[page]/[topage]'
let g:html_footer_center    = '%d.%m.%Y'

function HTML2PDF(...)
    "Requires wkhtmltopdf-static from AUR

    " Set defaults here:
    let l:colorscheme       =        get(g:, 'html_colorscheme',        'lucius')
    let l:font_size         = string(get(g:, 'html_font_size',          12))
    let l:margin_left       = string(get(g:, 'html_margin_left',        15))
    let l:margin_right      = string(get(g:, 'html_margin_right',       15))
    let l:margin_bottom     = string(get(g:, 'html_margin_bottom',      15))
    let l:margin_top        = string(get(g:, 'html_margin_top',         15))
    let l:use_header        = string(get(g:, 'html_use_header',         0))
    let l:header_font_size  = string(get(g:, 'html_header_font_size',   9))
    let l:header_font       =        get(g:, 'html_header_font',        'Courier New')
    let l:header_spacing    = string(get(g:, 'html_header_spacing',     5))
    let l:header_line       = string(get(g:, 'html_header_line',        0))
    let l:use_footer        = string(get(g:, 'html_use_footer',         0))
    let l:footer_font_size  = string(get(g:, 'html_footer_font_size',   9))
    let l:footer_font       =        get(g:, 'html_footer_font',        'Courier New')
    let l:footer_spacing    = string(get(g:, 'html_footer_spacing',     5))
    let l:footer_line       = string(get(g:, 'html_footer_line',        0))

    let l:header_left       = expand(strftime(g:html_header_left))
    let l:header_right      = expand(strftime(g:html_header_right))
    let l:header_center     = expand(strftime(g:html_header_center))
    let l:footer_left       = expand(strftime(g:html_footer_left))
    let l:footer_right      = expand(strftime(g:html_footer_right))
    let l:footer_center     = expand(strftime(g:html_footer_center))

    let l:tmp_path         = get(g:, 'tmp_path',  '/tmp/')

    "for var in [l:header_left, l:header_right, l:header_center, l:footer_left, l:footer_right, l:footer_center]
    "    let var = expand(strftime(var))
    "endfor

    let l:file_name = expand('%:t')
    let l:html_path = l:tmp_path . expand('%:t') . '.html'
    let l:pdf_path = get(a:, '2', expand('%:t') . '.pdf')
    let l:old_colors = g:colors_name

    set background=light
    execute 'colorscheme' l:colorscheme
    highlight Normal guifg=#000000 guibg=#FFFFFF ctermfg=16 ctermbg=15
    IndentLinesDisable

    TOhtml
    execute 'w!' l:html_path
    q!

    let l:sed  = '!sed -i "s/body {/body { font-size: '
    let l:sed .= string(get(g:, 'html_font_size', l:font_size))
    let l:sed .= 'px;/g; s/pre {/pre { font-size: '
    let l:sed .= string(get(g:, 'html_font_size', l:font_size))
    let l:sed .= 'px;/g" '
    let l:sed .= l:html_path

    "TODO fix sed not working on windows


    let l:wk  = '!wkhtmltopdf'
    let l:wk .= ' --no-background'
    let l:wk .= ' --margin-left '               . l:margin_left
    let l:wk .= ' --margin-right '              . l:margin_right
    let l:wk .= ' --margin-bottom '             . l:margin_bottom
    let l:wk .= ' --margin-top '                . l:margin_top

    if get(g:, 'html_use_header', l:use_header)
        let l:wk .= ' --header-font-name  ' . '"' . l:header_font       . '"'
        let l:wk .= ' --header-font-size '  .       l:header_font_size
        let l:wk .= ' --header-spacing '    .       l:header_spacing
        let l:wk .= ' --header-left '       . '"' . l:header_left       . '"'
        let l:wk .= ' --header-right '      . '"' . l:header_right      . '"'
        let l:wk .= ' --header-center '     . '"' . l:header_center     . '"'
        let l:wk .= (l:header_line ? ' --header-line' : '--no-header-line')
    endif

    if get(g:, 'html_use_footer', l:use_footer)
        let l:wk .= ' --footer-font-name '  . '"' . l:footer_font       . '"'
        let l:wk .= ' --footer-font-size '        . l:footer_font_size
        let l:wk .= ' --footer-spacing '          . l:footer_spacing
        let l:wk .= ' --footer-left '       . '"' . l:footer_left       . '"'
        let l:wk .= ' --footer-right '      . '"' . l:footer_right      . '"'
        let l:wk .= ' --footer-center '     . '"' . l:footer_center     . '"'
        let l:wk .= (l:footer_line ? ' --footer-line' : '--no-footer-line')
    endif

    let l:wk .= ' "' . l:html_path . '" "' . l:pdf_path . '"'

    execute l:sed
    execute l:wk

    IndentLinesEnable
    execute 'colorscheme' l:old_colors
    execute MyColors()
endfunction

command HTML2PDF execute HTML2PDF()
" }}}

" Spelling: {{{
set spellfile=~/.config/nvim/spell/additions.add
set spelllang=de_de,en_us,umlauts
" }}}

" Platform-specific and gui options: {{{
if has('win64')
    let g:tmp_path = 'E:\TEMP\'
    cd ~
endif

if has('gui')
    set guifont=Terminus_(TTF):h12
    set guioptions=''
    set guicursor+=n-v-c-i:blinkon0
endif
" }}}

" execute printf("%s%s%s", '!cp',  l:file_a, l:file_b) l:file_c

" vim: fdm=marker:
