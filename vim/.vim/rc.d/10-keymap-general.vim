" ==================================================
" Basic Mappings
" ==================================================

" Maps for jj to act as Esc in insert and command modes
ino jj <esc>
cno jj <c-c>

" One can map ctrl-c to something else if needed
map <c-c> <Nop>
imap <c-c> <Nop>

" Smarter j/k navigation
" Convert the j and k movement commands from strict linewise movements to
" onscreen display line movements via the gj and gk commands. When
" preceded with a count we want to go back to strict linewise movements.
" will automatically save movements larger than 5 lines to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Center next/previous matched string
nnoremap n nzz
nnoremap N Nzz

" quick make
map <F6> :make<CR>

" simple pasting from the system clipboard
" http://tilvim.com/2014/03/18/a-better-paste.html
map <Leader>p :set paste<CR>o<esc>"+]p:set nopaste<cr>

" un-highlight when esc is pressed
"map <silent><esc> :noh<cr>


" Quickly toggle relative line numbers
function ToggleRelativeLineNumbers()
  set invnumber
  set invrelativenumber
endfunction
nnoremap <leader>l :call ToggleRelativeLineNumbers()<cr>
" Toggle between absolute -> relative line number
"nnoremap <C-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>


" Save files as root
cnoremap w!! execute ':w suda://%'

" ==================================================
" vimrc handling
" ==================================================

" ,v loads .vimrc
" ,V reloads .vimrc -- activating changes (needs save)
"map <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_
"map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ==================================================
" Window navigation
" ==================================================

" control + vim direction key to navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" control + arrow key to navigate windows
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

" close all windows except the current one
nnoremap <leader>wco :only<cr>
nnoremap <leader>wcc :cclose<cr>

" windows creation
" create window on the bottom
nnoremap <leader>wb <c-w>s
" create vertical window
nnoremap <leader>wv <c-w>v

" " arrow keys resize windows
" nnoremap <Left> :vertical resize -10<CR>
" nnoremap <Right> :vertical resize +10<CR>
" nnoremap <Up> :resize -10<CR>
" nnoremap <Down> :resize +10<CR>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" ==================================================
" Splits handling
" ==================================================

" Make these all work in insert mode
"imap <C-W> <C-O><C-W>

" - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+

" alt-< or alt-> for vertical splits
map <m-,> <C-W>>
map <m-.> <C-W><

" F2 close current split (window)
noremap <F2> <Esc>:close<CR><Esc>

" Deleter buffer, keep the split (switch to prev buf, delete now prev buf)
nmap <leader>d :b#<bar>bd#<CR>

" ==================================================
" Tab navigation
" ==================================================
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<CR>
nnoremap tn :tabnew<cr>
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>

" move tab to first position
nnoremap tF :tabm 0<CR>
nnoremap tL :tabm<CR>

" Navigate tabs with shift-{h,l}
noremap <S-l> gt
noremap <S-h> gT

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" ==================================================
" Buffer navigation
" ==================================================
nmap <A-Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" ==================================================
" Clean all end of line whitespace with <Leader>S
" ==================================================
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
:nnoremap <silent><leader>S :call TrimWhitespace()<CR>

" ==================================================
" Spell checking
" ==================================================
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ==================================================
" Other Configurations
" ==================================================

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" remap the annoying u in visual mode
vmap u y

" shortcut to substitute current word under cursor
nnoremap <leader>[ :%s/<c-r><c-w>//g<left><left>

" Change in next bracket
nmap cinb cib

" delete character after cursor in insert mode
inoremap <C-d> <Del>

" highlight the line which is longer than the defined margin (120 character)
highlight MaxLineChar ctermbg=red
autocmd FileType php,js,vue,go call matchadd('MaxLineChar', '\%120v', 100)

" open devdocs.io with waterfox and search the word under the cursor
command! -nargs=? DevDocs :call system('type -p open >/dev/null 2>&1 && open https://devdocs.io/#q=<args> || waterfox -url https://devdocs.io/#q=<args>')
autocmd FileType python,ruby,rspec,javascript,go,html,php,eruby,coffee,haml nmap <buffer> <leader>D :exec "DevDocs " . fnameescape(expand('<cword>'))<CR>

" Markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Quit neovim terminal
tnoremap <C-\> <C-\><C-n>

" Open images with feh
autocmd BufEnter *.png,*.jpg,*gif silent! exec "! feh ".expand("%") | :bw

" A |Dict| specifies the matcher for filtering and sorting the completion candidates.
let g:cm_matcher={'module': 'cm_matchers.abbrev_matcher', 'case': 'smartcase'}

" Disable anoying ex mode
nnoremap Q <Nop>

" vim:set et sw=2:
