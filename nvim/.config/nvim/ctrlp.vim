Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_abbrev = {
  \ 'gmode': 'i',
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'pfrz',
    \ },
    \ ]
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|plugged\'
