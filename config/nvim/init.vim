set nocompatible              " be iMproved, required
filetype off                  " required
set shell=$SHELL
set encoding=utf-8
set fileencoding=utf-8
set mouse=a

let mapleader=","

if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif

exec "source ~/.config/nvim/vundle.vim"

nnoremap <leader>e :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map ; <Esc>

filetype on

augroup vimrcEx
  autocmd!

  filetype plugin indent on
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.{jscs,jshint,eslint} set filetype=json
  autocmd BufRead,BufNewFile *.{jsx,es6} set filetype=javascript
  autocmd BufRead,BufNewFile *.spec.js set filetype=javascript
  autocmd BufRead,BufNewFile *.slim set filetype=slim
  autocmd BufRead,BufNewFile *.rb set filetype=ruby
  autocmd BufRead,BufNewFile *.scss set filetype=scss.css
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
augroup END

filetype indent on

let g:impact_transbg=1
set termguicolors
syntax enable
colorscheme dracula

let g:NERDTreeWinSize=20

set backspace=2
set noswapfile
set history=50
set ruler
set number
set relativenumber

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set wrap
set linebreak
set nolist
set formatoptions-=tc
set laststatus=2

set textwidth=80
set numberwidth=5

" let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

" indent selection and stay selected
vnoremap > >gv
vnoremap < <gv

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<leader>x"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit="vertical"

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:prettier#config#single_quote="false"
let g:prettier#config#jsx_bracket_same_line="false"
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#trailing_comma = 'all'

" run Prettier on current buffer
nnoremap <leader>js :PrettierAsync<cr>

let g:tern#command = ["tern"]
let g:tern#argument = ["--persistent"]
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints="on_hold"

" move 10 rows at a time
nnoremap J 10j
nnoremap K 10k

" make squid
nnoremap <leader>sq i<%=<space>%><Esc>hhi
inoremap \sq <%=<space>%><Esc>hhi

" easier exit of insert mode
inoremap jk <Esc>:w<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>hs :split<cr>

nnoremap <leader>q :wq<cr>

nnoremap <leader>uq :e#<cr>

" change color of drop-down autocomplete
highlight Pmenu guibg=lightblue guifg=black

