let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = '.venv/bin/nvr'
let g:tex_flavor = 'latex'
let g:ale_linters_ignore = {
      \   'tex': ['lacheck'],
      \}
let g:ale_tex_chktex_options = "-I --nowarn 18"
augroup vimtex_config
  autocmd User VimtexEventInitPost VimtexCompile
augroup END
