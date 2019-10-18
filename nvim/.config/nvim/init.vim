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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/DrawIt', { 'on': 'DIsngl' }
Plug 'lervag/vimtex', { 'for': 'plaintex,tex,bib' }

" Completion / Snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'Shougo/neco-vim'
"Plug 'poppyschmo/deoplete-latex', { 'for': 'plaintex,tex,bib' }

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
noremap q: <nop>
map <PageUp> <nop>
imap <PageUp> <nop>
map <PageDown> <nop>
imap <PageDown> <nop>
map <F1> <nop>
imap <F1> <nop>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

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

" Rofi file browser
nnoremap <silent> <C-p> :call RofiFB()<CR>
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

" Other Plugin Settings: {{{
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

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

" Commands and Functions: {{{
command W w
command Q q
command Wq wq
command WQ wq

command -range QR <line1>,<line2>!curl -s -F-=\<- qrenco.de
" }}}

" Spelling: {{{
set spellfile=~/.config/nvim/spell/additions.add
set spelllang=de_de,en_us,umlauts
set spellcapcheck=
set spell
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

" Rofi file browser {{{
function RofiFB()
    let l:file = system("rofi -show file-browser
                            \ -file-browser-dir \"" . getcwd() . "\"
                            \ -file-browser-depth 10
                            \ -file-browser-only-files
                            \ -file-browser-stdout")
    let l:file = substitute(l:file, " ", "\\ ", "")
    if (len(l:file) > 0)
        execute("edit " . l:file)
    endif
endfunction
" }}}

" vim: fdm=marker:
