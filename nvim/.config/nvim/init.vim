" Plugins: {{{
call plug#begin('~/git/vim-plug')

" Themes
Plug 'morhetz/gruvbox'
Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Utility
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'

" Completion / Snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neco-vim'
Plug 'lervag/vimtex', { 'for': 'plaintex,tex,bib' }
"Plug 'poppyschmo/deoplete-latex', { 'for': 'plaintex,tex,bib' }

" Hard mode
Plug 'wikitopian/hardmode'

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
set cursorline
set number
set relativenumber
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore+=*.pdf
set laststatus=2
set hlsearch
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:>,precedes:<
set list
set nowrap
set noshowmode
set t_Co=256

set backspace=indent,eol,start
set foldmethod=manual
set modeline
set ignorecase
set scrolloff=8
set lazyredraw
set mouse=a

set encoding=utf-8
set fileformat=unix
set hidden
" }}}

" Key Mappings: {{{
let mapleader= ","

" System Clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "+Y
noremap <leader>P "+P
inoremap <leader>p <ESC>"+pa

" Normal Mappings
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap <leader>j :bnext! <CR>
nnoremap <leader>k :bprev! <CR>
nnoremap <C-j> :bnext! <CR>
nnoremap <C-k> :bprev! <CR>
nnoremap <leader>q :bd <CR>
nnoremap <Leader>n :NERDTreeToggle <CR>
nnoremap <silent> <ESC> :nohlsearch<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-a> <ESC>

" Clear Annoying Keys
nmap Q <nop>
map <PageUp> <nop>
imap <PageUp> <nop>
map <PageDown> <nop>
imap <PageDown> <nop>
map <F1> <nop>
imap <F1> <nop>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Remap command history
noremap q: <nop>
noremap <leader>h q:

" Airline buffers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" EasyMotion
map <leader>f <Plug>(easymotion-sn)

" Vimtex
map <leader>l :VimtexView<CR>
map mm :w<CR>:VimtexCompile<CR>
" }}}

" Airline: {{{
let g:airline_extensions = ['tabline', 'branch', 'hunks']
let g:airline_theme='mybase16'
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_inactive_collapse = 0

let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▌'
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = '▐'
let g:airline_right_alt_sep = '│'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = ' +'

let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
    \ '0': ' [0] ',
    \ '1': ' [1] ',
    \ '2': ' [2] ',
    \ '3': ' [3] ',
    \ '4': ' [4] ',
    \ '5': ' [5] ',
    \ '6': ' [6] ',
    \ '7': ' [7] ',
    \ '8': ' [8] ',
    \ '9': ' [9] '
    \}

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '•', '-']

function FileFormat()
    return &ff
endfunction

function Encoding()
    return &fenc.(&l:bomb ? ' [BOM]' : '')
endfunction

function Branch()
    return airline#extensions#branch#get_head()
endfunction

function Hunks()
    " Remove leading and trailing whitespaces
    return join(split(airline#extensions#hunks#get_hunks(), ' '), ' ')
endfunction

function! AirlineInit()
    call airline#parts#define_function('ff', 'FileFormat')
    call airline#parts#define_function('enc', 'Encoding')
    call airline#parts#define_function('branch', 'Branch')
    call airline#parts#define_function('hunks', 'Hunks')
    call airline#parts#define('linenr', { 'raw': '%2p%% of %L', 'accent': 'bold'})
    call airline#parts#define('colnr', {'raw': '%2v'})

    let g:airline_section_b = airline#section#create_left(['branch', 'hunks'])
    let g:airline_section_y = airline#section#create_right(['enc', 'ff'])
    let g:airline_section_z = airline#section#create_right(['linenr', 'colnr'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
" }}}

" EasyMotion: {{{
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
" }}}

" Other Plugin Settings: {{{
set updatetime=1000
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_modified_removed = '•'

let g:ctrlp_working_path_mode = '0'
"}}}

" Vimtex Settings: {{{
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexrun = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '/tmp/latexrun',
    \ 'options' : [
    \   '--latex-args="--shell-escape -synctex=1"'
    \ ]
\}

let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_latexlog = {
    \ 'overfull' : 0,
    \ 'underfull' : 0
\}

let g:vimtex_view_method = 'zathura'

let g:tex_flavor = 'latex'
" }}}

" Completion Settings: {{{
set pumheight=10
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert
set smartcase

inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <expr><Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr><CR>  pumvisible() ? "\<C-x><CR>" : "\<CR>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0

let g:UltiSnipsExpandTrigger = "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

command DeopleteToggle call deoplete#toggle()
" }}}

" Colors: {{{
colorscheme gruvbox
set background=dark

function MyColors()
    " Normal Colors
    hi Normal ctermfg=NONE ctermbg=NONE
    hi LineNr ctermbg=NONE
    hi CursorLine ctermbg=0
    hi ColorColumn ctermbg=0
    hi Folded ctermbg=0
    hi CursorLineNr ctermfg=3 ctermbg=0
    hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
    hi WildMenu ctermbg=NONE ctermfg=3
    hi Whitespace ctermfg=8

    " EasyMotion Colors
    hi EasyMotionIncSearch ctermfg=3
    hi EasyMotionTarget cterm=bold ctermfg=3 ctermbg=NONE

    " Gutter Colors
    hi SignColumn ctermbg=NONE
    hi GitGutterAdd ctermfg=2 ctermbg=NONE
    hi GitGutterChange ctermfg=3 ctermbg=NONE
    hi GitGutterChangeDelete ctermfg=1 ctermbg=NONE
    hi GitGutterDelete ctermfg=1 ctermbg=NONE

    " Gui Colors
    if has('gui')
        highlight Comment gui=NONE
    endif
endfunction

autocmd ColorScheme * call MyColors()
execute MyColors()
" }}}

" Highlights: {{{
function HighlightSections()
    syntax match section /^\d.*$/ containedin=Normal
    highlight def section ctermfg=3
endfunction
command HighlightSections execute HighlightSections()
" }}}

" Commands and Functions: {{{
command W w
command Q q
command Wq wq
command WQ wq

command -range QR <line1>,<line2>!curl -s -F-=\<- qrenco.de
" }}}

" Printing: {{{
" actual TOhtml variables
let g:html_number_lines     = 0
let g:html_font             = "Courier New"

let g:html_colorscheme      = "lucius"
let g:html_font_size        = 12
let g:html_margin_header    = 7
let g:html_margin_footer    = 7
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
    let l:margin_header     = string(get(g:, 'html_margin_header',      7))
    let l:margin_footer     = string(get(g:, 'html_margin_footer',      7))
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

    if l:use_header
        let l:margin_top += l:margin_header
    endif
    if l:use_footer
        let l:margin_bottom += l:margin_footer
    endif

    let l:tmp_path         = get(g:, 'tmp_path',  '/tmp/')

    let l:file_name = expand('%:t')
    let l:html_path = l:tmp_path . expand('%:t') . '.html'
    let l:pdf_path = get(a:, '2', expand('%:t') . '.pdf')
    let l:old_colors = g:colors_name

    set background=light
    execute 'colorscheme' l:colorscheme
    highlight Normal guifg=#000000 guibg=#FFFFFF ctermfg=16 ctermbg=15

    TOhtml
    execute 'w!' l:html_path
    q!

    let l:sed  = '!sed -i "s/body {/body { font-size: '
    let l:sed .= string(get(g:, 'html_font_size', l:font_size))
    let l:sed .= 'px;/g; s/pre {/pre { font-size: '
    let l:sed .= string(get(g:, 'html_font_size', l:font_size))
    let l:sed .= 'px;/g" '
    let l:sed .= l:html_path

    let l:wk  = '!wkhtmltopdf'
    let l:wk .= ' --no-background'
    let l:wk .= ' --margin-left '               . l:margin_left
    let l:wk .= ' --margin-right '              . l:margin_right
    let l:wk .= ' --margin-bottom '             . l:margin_bottom
    let l:wk .= ' --margin-top '                . l:margin_top

    if l:use_header
        let l:wk .= ' --header-font-name  ' . '"' . l:header_font       . '"'
        let l:wk .= ' --header-font-size '  .       l:header_font_size
        let l:wk .= ' --header-spacing '    .       l:header_spacing
        let l:wk .= ' --header-left '       . '"' . l:header_left       . '"'
        let l:wk .= ' --header-right '      . '"' . l:header_right      . '"'
        let l:wk .= ' --header-center '     . '"' . l:header_center     . '"'
        let l:wk .= (l:header_line ? ' --header-line' : '--no-header-line')
    endif

    if l:use_footer
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

    execute 'colorscheme' l:old_colors
    execute MyColors()
endfunction

command HTML2PDF execute HTML2PDF()
" }}}

" Spelling: {{{
set spellfile=~/.config/nvim/spell/additions.add
set spelllang=de_de,en_us,umlauts
set spellcapcheck=
set spell
" }}}

" Platform-specific options: {{{
if has('win64') || has('win32')
    let g:tmp_path = 'E:\TEMP\'
endif
" }}}

" GUI options {{{
if has('gui')
    set guifont=Terminus_(TTF):h12
    set guioptions=''
"    set guicursor+=n-v-c-i:blinkon0

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.whitespace = ''
endif
" }}}

" Neovim options {{{
if has('nvim')
    set inccommand=nosplit
endif
" }}}

" vim: fdm=marker:
