" ============================================================
" materialmonokaiedit
" Author: skielbasa
" Forked From: Mike Hartington's Oceanicnext
" ============================================================

if ! exists("g:materialmonokaiedit_subtle_airline")
    let g:materialmonokaiedit_subtle_airline = 0
endif

" {{{ Colors
  "let s:base00=['#242530', '233']
  " let s:base00=['#282a36', '233']
	let s:splitfg=['#7396a2', '236']
	let s:splitfg2=['#7396a2', '236']
  let s:base00=['#494c62', '233'] " base line bg
  let s:base01=['#383a3e', '236']
  let s:base02=['#4f5b66', '240']
  let s:base03=['#B0BEC5', '253']
  let s:base04=['#a7adba', '145']
  let s:base05=['#c0c5ce', '251']
  let s:base06=['#cdd3de', '252'] " base text
  let s:base07=['#d8dee9', '253']
  let s:base08=['#ec5f67', '203']
  let s:base09=['#FD9720', '208']
  let s:base0A=['#fac863', '221']
  "let s:base0B=['#FC3488', '197']
  "let s:base0B=['#e22e7a', '197'] " shade darker of above
  let s:base0B=['#c9296c', '197'] " shade darker of above
  let s:base0C=['#62b3b2', '73']
  let s:base0D=['#506E79', '241']
  let s:base0E=['#c594c5', '141']
  let s:base0F=['#ab7967', '137']
  " let s:base10=['#ffffff', '15']
  let s:base10=['CDD3DE', '15']
" }}}

" let s:normal1   = [s:base10[0], s:base0D[0], s:base10[1], s:base0D[1]]
let s:normal1   = [s:base10[0], s:base00[0], s:base10[1], s:base0D[1]]
let s:normal2   = [s:base00[0], s:base03[0], s:base00[1], s:base03[1]]
let s:normal3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
let s:inactive1 = [s:base00[0], s:base03[0], s:base00[1], s:base03[1]]
let s:inactive2 = [s:splitfg[0], s:base00[0], s:splitfg[1], s:base00[1]]
let s:inactive3 = [s:splitfg[0], s:base00[0], s:splitfg[1], s:base00[1]]
let s:insert1   = [s:base10[0], s:base0B[0], s:base10[1], s:base0B[1]]
let s:insert2   = [s:base00[0], s:base03[0], s:base00[1], s:base03[1]]
let s:insert3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
let s:replace1  = [s:base10[0], s:base08[0], s:base10[1], s:base08[1]]
let s:replace2  = [s:base00[0], s:base03[0], s:base00[1], s:base03[1]]
let s:replace3  = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
let s:visual1   = [s:base10[0], s:base09[0], s:base10[1], s:base09[1]]
let s:visual2   = [s:base00[0], s:base03[0], s:base00[1], s:base03[1]]
let s:visual3   = [s:base07[0], s:base00[0], s:base07[1], s:base00[1]]
let s:ctrlp1    = [s:base10[0], s:base00[0], s:base10[1], s:base00[1]]
let s:ctrlp2    = [s:base10[0], s:base03[0], s:base10[1], s:base03[1]]
let s:ctrlp3    = [s:base10[0], s:base0D[0], s:base10[1], s:base0D[1]]
let s:warning   = [s:base00[0], s:base09[0], s:base00[1], s:base09[1]]
let s:error     = [s:base00[0], s:base08[0], s:base00[1], s:base08[1]]

let g:airline#themes#materialmonokaiedit#palette = {}

let g:airline#themes#materialmonokaiedit#palette.inactive = airline#themes#generate_color_map(s:inactive1, s:inactive2, s:inactive3)

if g:materialmonokaiedit_subtle_airline == 1
  let g:airline#themes#materialmonokaiedit#palette.normal = airline#themes#generate_color_map(s:normal1, s:normal2, s:normal3, s:normal3, s:normal2, s:normal1)
  let g:airline#themes#materialmonokaiedit#palette.insert = airline#themes#generate_color_map(s:insert1, s:insert2, s:insert3, s:normal3, s:normal2, s:normal1)
  let g:airline#themes#materialmonokaiedit#palette.replace = airline#themes#generate_color_map(s:replace1, s:replace2, s:replace3, s:normal3, s:normal2, s:normal1)
  let g:airline#themes#materialmonokaiedit#palette.visual = airline#themes#generate_color_map(s:visual1, s:visual2, s:visual3, s:normal3, s:normal2, s:normal1)
  let g:airline#themes#materialmonokaiedit#palette.visual.airline_warning = s:warning
  let g:airline#themes#materialmonokaiedit#palette.visual.airline_error = s:error
else
  let g:airline#themes#materialmonokaiedit#palette.normal = airline#themes#generate_color_map(s:normal1, s:normal2, s:normal3)
  let g:airline#themes#materialmonokaiedit#palette.insert = airline#themes#generate_color_map(s:insert1, s:insert2, s:insert3)
  let g:airline#themes#materialmonokaiedit#palette.replace = airline#themes#generate_color_map(s:replace1, s:replace2, s:replace3)
  let g:airline#themes#materialmonokaiedit#palette.visual = airline#themes#generate_color_map(s:visual1, s:visual2, s:visual3)
endif

let g:airline#themes#materialmonokaiedit#palette.normal.airline_warning = s:warning
let g:airline#themes#materialmonokaiedit#palette.normal.airline_error = s:error
let g:airline#themes#materialmonokaiedit#palette.insert.airline_warning = s:warning
let g:airline#themes#materialmonokaiedit#palette.insert.airline_error = s:error

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#materialmonokaiedit#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:ctrlp1, s:ctrlp2, s:ctrlp3)
