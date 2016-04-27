let s:N1 = [ '#005f00' , '#aeee00' , 22 , 155] " - normal inside & outside
let s:N2 = [ '#f4cf86' , '#45413b' , 222 , 238 ] " dirtyblonde    & deepgravel
let s:N3 = [ '#8cffba' , '#242321' , 121 , 235 ] " saltwatertaffy & darkgravel
let s:N4 = [ '#666462' , 241 ]                   " mediumgravel

let s:I1 = [ '#000087' , '#0a9dff' , 18 , 39  ] " - insert inside & outside
let s:I2 = [ '#f4cf86' , '#005fff' , 222 , 25  ] " dirtyblonde    & facebook
let s:I3 = [ '#0a9dff' , '#242321' , 39  , 235 ] " tardis         & darkgravel

let s:V1 = [ '#262626' , '#ffa724' , 235 , 215 ] " - visual inside & outside
let s:V2 = [ '#000000' , '#fade3e' , 16  , 222 ] " coal           & dalespale
let s:V3 = [ '#ff8700' , '#262626' , 208  , 235 ] " - visual font & background
let s:V4 = [ '#444444' , 238 ]                   " - visual background on unsaved file

let s:PA = [ '#0a9dff' , 39 ]                   " dirtyblonde
let s:RE = [ '#eeeeee' , 255 ]                   " paste background

let s:IA = [ s:N3[1] , s:N2[1] , s:N3[3] , s:N2[3] , '' ]

let g:airline#themes#mytheme#palette = {}

let g:airline#themes#mytheme#palette.accents = {
      \ 'red': [ '#ff2c4b' , '' , 196 , '' , '' ]
      \ }

let g:airline#themes#mytheme#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#mytheme#palette.normal_modified = {
      \ 'airline_b': [ s:N2[0]   , s:N4[0]   , s:N2[2]   , s:N4[1]   , ''     ] ,
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }


let g:airline#themes#mytheme#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#mytheme#palette.insert_modified = {
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }
let g:airline#themes#mytheme#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , s:PA[0]   , s:I1[2]   , s:PA[1]   , ''     ] }


let g:airline#themes#mytheme#palette.replace = copy(airline#themes#mytheme#palette.insert)
let g:airline#themes#mytheme#palette.replace.airline_a = [ s:I1[0] , s:RE[0] , s:I1[2] , s:RE[1] , '' ]
let g:airline#themes#mytheme#palette.replace_modified = g:airline#themes#mytheme#palette.insert_modified


let g:airline#themes#mytheme#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#mytheme#palette.visual_modified = {
      \ 'airline_c': [ s:V3[0]   , s:V4[0]   , s:V3[2]   , s:V4[1]   , ''     ] }


let g:airline#themes#mytheme#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#mytheme#palette.inactive_modified = {
      \ 'airline_c': [ s:V1[1]   , ''        , s:V1[3]   , ''        , ''     ] }
