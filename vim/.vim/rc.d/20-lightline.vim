" ==================================================
" lightline
" ==================================================
let g:lightline = { 'colorscheme': 'tokyonight' }

let g:lightline.active = {
                  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename','gitbranch', 'modified', 'neospinner'] ],
                  \   'right': [ [ 'lineinfo' ], [ 'percent', 'wordcount', 'charcount' ], [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
                  \ }
let g:lightline.component = {
                  \   'charvaluehex': '0x%B',
                  \   'readonly': '%{&readonly?"⭤":""}'
                  \ }

" vim:set et sw=2:
