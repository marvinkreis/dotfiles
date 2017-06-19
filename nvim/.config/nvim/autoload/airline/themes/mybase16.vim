" vim-airline template by chartoin (http://github.com/chartoin)

let g:airline#themes#mybase16#palette = {}

" _mod is the color for when the file is modified
" TODO make variants for all colors?



" ========== GUI COLORS ==========

" Layer 1
let s:gui_l1_bg_normal      = "#97c073"
let s:gui_l1_bg_insert      = "#6da3c1"
let s:gui_l1_bg_visual      = "#e5c280"
let s:gui_l1_bg_replace     = "#6c89c6"
let s:gui_l1_fg             = "#364043"

" Layer 2
let s:gui_l2_bg             = "#4a5457"
let s:gui_l2_fg             = "#cccaca"

" Layer 3
let s:gui_l3_bg             = "#364043"     " also tabbar bg
let s:gui_l3_fg             = "#cccaca"
let s:gui_l3_fg_mod         = "#e5c280"

" Inactive
let s:gui_i_bg              = "#4a5457"
let s:gui_i_fg              = "#cccaca"



" ========== 256 COLORS ==========

" Layer 1
let s:l1_bg_normal      = 2
let s:l1_bg_insert      = 6
let s:l1_bg_visual      = 3
let s:l1_bg_replace     = 4
let s:l1_fg             = 0

" Layer 2
let s:l2_bg             = 8
let s:l2_fg             = 7

" Layer 3
let s:l3_bg             = 0     " also tabbar bg
let s:l3_fg             = 7
let s:l3_fg_mod         = 3



let s:N1   = [ s:gui_l1_fg,   s:gui_l1_bg_normal,   s:l1_fg,    s:l1_bg_normal ]
let s:N2   = [ s:gui_l2_fg,   s:gui_l2_bg,          s:l2_fg,    s:l2_bg ]
let s:N3   = [ s:gui_l3_fg,   s:gui_l3_bg,          s:l3_fg,    s:l3_bg ]
let g:airline#themes#mybase16#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui_l1_fg,   s:gui_l1_bg_insert,   s:l1_fg,    s:l1_bg_insert ]
let s:I2   = [ s:gui_l2_fg,   s:gui_l2_bg,          s:l2_fg,    s:l2_bg ]
let s:I3   = [ s:gui_l3_fg,   s:gui_l3_bg,          s:l3_fg,    s:l3_bg ]
let g:airline#themes#mybase16#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui_l1_fg,   s:gui_l1_bg_replace,  s:l1_fg,    s:l1_bg_replace ]
let s:R2   = [ s:gui_l2_fg,   s:gui_l2_bg,          s:l2_fg,    s:l2_bg ]
let s:R3   = [ s:gui_l3_fg,   s:gui_l3_bg,          s:l3_fg,    s:l3_bg ]
let g:airline#themes#mybase16#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui_l1_fg,   s:gui_l1_bg_visual,   s:l1_fg,    s:l1_bg_visual ]
let s:V2   = [ s:gui_l2_fg,   s:gui_l2_bg,          s:l2_fg,    s:l2_bg ]
let s:V3   = [ s:gui_l3_fg,   s:gui_l3_bg,          s:l3_fg,    s:l3_bg ]
let g:airline#themes#mybase16#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let s:IA2   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let s:IA3   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let g:airline#themes#mybase16#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" When file is modified (Only difference right now is layer 3 fg

let s:N1   = [ s:gui_l1_fg,       s:gui_l1_bg_normal,   s:l1_fg,        s:l1_bg_normal ]
let s:N2   = [ s:gui_l2_fg,       s:gui_l2_bg,          s:l2_fg,        s:l2_bg ]
let s:N3   = [ s:gui_l3_fg_mod,   s:gui_l3_bg,          s:l3_fg_mod,    s:l3_bg ]
let g:airline#themes#mybase16#palette.normal_modified = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui_l1_fg,       s:gui_l1_bg_insert,   s:l1_fg,        s:l1_bg_insert ]
let s:I2   = [ s:gui_l2_fg,       s:gui_l2_bg,          s:l2_fg,        s:l2_bg ]
let s:I3   = [ s:gui_l3_fg_mod,   s:gui_l3_bg,          s:l3_fg_mod,    s:l3_bg ]
let g:airline#themes#mybase16#palette.insert_modified = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui_l1_fg,       s:gui_l1_bg_replace,  s:l1_fg,        s:l1_bg_replace ]
let s:R2   = [ s:gui_l2_fg,       s:gui_l2_bg,          s:l2_fg,        s:l2_bg ]
let s:R3   = [ s:gui_l3_fg_mod,   s:gui_l3_bg,          s:l3_fg_mod,    s:l3_bg ]
let g:airline#themes#mybase16#palette.replace_modified = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui_l1_fg,       s:gui_l1_bg_visual,   s:l1_fg,        s:l1_bg_visual ]
let s:V2   = [ s:gui_l2_fg,       s:gui_l2_bg,          s:l2_fg,        s:l2_bg ]
let s:V3   = [ s:gui_l3_fg_mod,   s:gui_l3_bg,          s:l3_fg_mod,    s:l3_bg ]
let g:airline#themes#mybase16#palette.visual_modified = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let s:IA2   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let s:IA3   = [ s:gui_i_fg, s:gui_i_bg, 7, 8 ]
let g:airline#themes#mybase16#palette.inactive_modified = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#mybase16#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#000000', '#000000', 0, 0, '' ],
      \ [ '#000000', '#000000', 0, 0, '' ],
      \ [ '#000000', '#000000', 0, 0, 'bold' ])
