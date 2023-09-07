" ==================================================
" vim-plug  setup
" ==================================================
"
call plug#begin('~/.local/share/vim/plugged')

" Color schemes and appearance
Plug 'folke/tokyonight.nvim'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/vim-journal'
Plug 'bling/vim-bufferline'


" General utilities
Plug 'simeji/winresizer' " easy way to rezise and exchange windows
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ervandew/supertab'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'blueyed/vim-diminactive' " Plug to dim not-focused windows
Plug 'lambdalisue/suda.vim' " Write file with sudo
Plug 'junegunn/vim-peekaboo' " Display register values on " and @
"Plug 'yangmillstheory/vim-snipe' " replace f F t T to target easily the motion
Plug 'simnalamburt/vim-mundo' " undo tree


" Version control support
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'junegunn/gv.vim'

" Programming support
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/Shebang'
Plug 'Valloric/MatchTagAlways'
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'
Plug 'AndrewRadev/splitjoin.vim' " Split arrays in PHP / struct in Go / other things

" Jump to definition
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

" fzf - poweful fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
source /usr/share/doc/fzf/examples/fzf.vim

" allow multisearch in current directory / multi replace as well
Plug 'wincent/ferret'

" Generic Programming Support
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'HiPhish/repl.nvim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/Fold-license'
Plug 'neomake/neomake'
Plug 'ap/vim-css-color' " display the hexadecimal colors - useful for css and color config
Plug 'tpope/vim-sleuth'

" Polyglot
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
Plug 'ericpruitt/tmux.vim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lambdatoast/elm.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'lumiliet/vim-twig', {'for': 'twig'}
Plug 'maelvalais/gmpl.vim'
Plug 'mboughaba/i3config.vim'
Plug 'McSinyx/vim-octave'
Plug 'neovimhaskell/haskell-vim'
Plug 'ocaml/vim-ocaml'
Plug 'ocaml/vim-ocaml'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-yaml'
Plug 'sudar/vim-arduino-syntax'
Plug 'tbastos/vim-lua'
Plug 'tpope/vim-markdown'
Plug 'udalov/kotlin-vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/gnuplot-syntax-highlighting'
Plug 'vim-scripts/R.vim'
Plug 'vim-scripts/svg.vim'
Plug 'voldikss/vim-mma'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'wlangstroth/vim-racket'
Plug 'mattn/emmet-vim' " emmet for html

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'jtratner/vim-flavored-markdown'

" LaTeX
Plug 'lervag/vimtex'

" Programming languages
Plug 'bfrg/vim-cpp-modern'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'racer-rust/vim-racer'
Plug 'Quramy/tsuquyomi'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/po.vim--Jelenak'

" PHP Support
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'tobyS/pdv'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'Rican7/php-doc-modded'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'

" Elixir Support
Plug 'avdgaag/vim-phoenix'
Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
Plug 'BjRo/vim-extest'
Plug 'frost/vim-eh-docs'
Plug 'slashmili/alchemist.vim'
"Plug 'tpope/vim-endwise'
Plug 'jadercorrea/elixir_generator.vim'
Plug 'mhinz/vim-mix-format'

" golang development
Plug 'godoctor/godoctor.vim', {'for': 'go'} " refactoring
Plug 'sebdah/vim-delve', {'for': 'go'} " debugger

" javascript plugins
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'leafgarland/typescript-vim'

" For react
Plug 'mxw/vim-jsx'

" Smart Autocomplete
Plug 'w0rp/ale'
Plug 'kristijanhusak/deoplete-phpactor'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-clang'
Plug 'wokalski/autocomplete-flow'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi'
Plug 'shougo/neco-vim'
Plug 'othree/csscomplete.vim'
Plug 'othree/xml.vim'
Plug 'c9s/perlomni.vim'
Plug 'artur-shaik/vim-javacomplete2'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

call plug#end()

" vim:set et sw=2:
