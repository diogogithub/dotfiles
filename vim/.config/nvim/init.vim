" ==================================================
" Source the files ~/.vim/rc.d/
" ==================================================
for f in split(glob('~/.vim/rc.d/*.vim'), '\n')
  exe 'source' f
endfor

" vim:set et sw=2:
