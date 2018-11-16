set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" VIM Command menus
" Plugin 'DoodlingDev/vim-mission-control'
" tells mission control where to look for plugins
let g:PLUGIN_PATH="~/.config/nvim/bundle"

"indentation guides
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"Emmet
Plugin 'mattn/emmet-vim'

" fuzzy finder for a lot of things
Plugin 'shougo/denite.nvim'

Plugin 'tpope/vim-endwise'

Plugin 'easymotion/vim-easymotion'

"Toggle tab sizes
Plugin 'roman/golden-ratio'

" JSX highlighting
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Helps neoVim use terminal colors properly
Plugin 'godlygeek/csapprox'

" highlighting and helpers for a bunch of languages
Plugin 'sheerun/vim-polyglot'

" JSDoc auto-snippets
Plugin 'heavenshell/vim-jsdoc'

" Use fzf for fuzzy finding
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" color!
Plugin 'dracula/vim'

" Cool-lookin' status bar
Plugin 'vim-airline/vim-airline'

" Asynchronous Linting
Plugin 'w0rp/ale'

" supertab <TAB> addon
Plugin 'ervandew/supertab'

" javascript libraries support
Plugin 'othree/javascript-libraries-syntax.vim'

" NERDTree File Browser
Plugin 'scrooloose/nerdtree'

" Commenting made easy
Plugin 'tpope/vim-commentary'

" Auto pair brackets
Plugin 'jiangmiao/auto-pairs'

" Snippets Driver
Plugin 'SirVer/ultisnips'
" Snippets library
Plugin 'honza/vim-snippets'

" javascript code formatting automatically
Plugin 'prettier/vim-prettier'

" git integrations
Plugin 'tpope/vim-fugitive'

" js code analysis
Plugin 'ternjs/tern_for_vim'

" better javascript highlighting
Plugin 'pangloss/vim-javascript'

call vundle#end() 




